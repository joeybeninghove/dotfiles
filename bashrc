# enable coloring in terminal
export CLICOLOR=1

# paths
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:vendor/bin

# vim for life
export EDITOR="vim"

# ignores dupes in the history
export HISTCONTROL=ignoredups 

# after each command, checks the windows size and changes lines and columns
shopt -s checkwinsize 

# ignore case in bash completion
bind "set completion-ignore-case on" 

# no bell
bind "set bell-style none"

# show completion without double tab-ing
bind "set show-all-if-ambiguous On"

# load aliases
source ~/.aliases

# load private exports
source ~/Documents/Security/bash_exports

# load git completion
source ~/.git-completion

# load prompt
source ~/.prompt

# init rbenv
eval "$(rbenv init -)"

# init phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# add composer bins to path
export PATH=$HOME/.composer/vendor/bin:$PATH

# add bin dirs to path
export PATH=$HOME/-/bin:./node_modules/.bin:./bin:$PATH

export RACK_ENV=development
export RAILS_ENV=development

# needed to get gpg working with stdin
GPG_TTY=$(tty)
export GPG_TTY

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export ANDROID_SDK=/Users/joey/Library/Android/sdk
export PATH=/Users/joey/Library/Android/sdk/platform-tools:$PATH

# load z
source /usr/local/etc/profile.d/z.sh
