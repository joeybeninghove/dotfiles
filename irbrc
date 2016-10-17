require "rubygems"

# awesome print
#begin
#  require "awesome_print"
#  AwesomePrint.irb!
#rescue LoadError => e
#  warn "Couldn't load awesome_print: #{e}"
#end

IRB.conf[:PROMPT_MODE] = :SIMPLE

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
