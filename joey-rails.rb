def add_gems
  gem "turbolinks"

  gem_group :development, :test do
    gem "rspec-rails"
  end
end

def install_rspec
  run "spring stop"
  generate("rspec:install")
end

def install_rails_ujs
  run "yarn add rails-ujs"
  config = %q(
import Rails from "rails-ujs"
Rails.start()
  )

  inside "app/javascript/packs" do
    text = IO.read "application.js"
    IO.write "application.js", "#{config}\n" + text
  end
end

def install_turbolinks
  run "yarn add turbolinks"
  config = %q(
import Turbolinks from "turbolinks"
Turbolinks.start()
  )

  inside "app/javascript/packs" do
    text = IO.read "application.js"
    IO.write "application.js", "#{config}\n" + text
  end
end

def install_tailwind
  run "yarn add tailwindcss"
  run "./node_modules/.bin/tailwind init ./app/javascript/tailwind.js"

  postcss_config = %q(
plugins:
  postcss-import: {}
  tailwindcss: "./app/javascript/tailwind.js"
  postcss-cssnext: {}
  )
  IO.write ".postcssrc.yml", postcss_config

  application_css = %q(
@import "tailwindcss/preflight";
@import "preflight";
@import "tailwindcss/components";
@import "components";
@import "tailwindcss/utilities";
@import "utilities";
  )

  inside "app/javascript" do
    IO.write "preflight.css", ""
    IO.write "components.css", ""
    IO.write "utilities.css", ""
    IO.write "application.css", application_css
  end

  css_config = "import \"../application.css\""
  inside "app/javascript/packs" do
    text = IO.read "application.js"
    IO.write "application.js", text + "\n#{css_config}"
  end
end

def configure_layout
  inside "app/views/layouts" do
    layout = IO.read "application.html.erb"
    layout.gsub! "stylesheet_link_tag", "stylesheet_pack_tag"
    layout.gsub! "javascript_include_tag", "javascript_pack_tag"
    IO.write "application.html.erb", layout
  end
end

def create_rake_tasks
  rakefile("db.rake") do
    <<-TASK
      namespace :db do
        task :remigrate => ["restart", "db:drop", "db:create", "db:migrate"]
      end
    TASK
  end
end

def db_remigrate
  rails_command "db:remigrate"
end

def webpacker_compile
  rails_command "webpacker:compile"
end

def configure_puma_dev
  run "rm #{Dir.home}/.puma-dev/#{@app_path}"
  run "ln -s #{File.dirname(__FILE__)}/#{@app_path} #{Dir.home}/.puma-dev/#{@app_path}"
end

def git_commit(message)
  git add: "."
  git commit: "-a -m '#{message}'"
end

# MAIN
add_gems

after_bundle do
  git :init
  git_commit "Initial commit"

  install_rspec
  git_commit "Install RSpec"

  install_rails_ujs
  git_commit "Install rails-ujs"

  install_turbolinks
  git_commit "Install turbolinks"

  install_tailwind
  git_commit "Install Tailwind"

  configure_layout
  git_commit "Configure layout with webpack tags"

  create_rake_tasks
  git_commit "Add db rake tasks"

  db_remigrate
  webpacker_compile
  configure_puma_dev
end
