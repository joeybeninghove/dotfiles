# enable coloring in terminal
export CLICOLOR=1

# paths
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:vendor/bin:~/.rbenv/bin

# vim for life
export EDITOR="vim"

# ignores dupes in the history
export HISTCONTROL=ignoredups 

# after each command, checks the windows size and changes lines and columns
shopt -s checkwinsize 

# load aliases
source ~/.aliases

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
export PATH=./node_modules/.bin:./bin:$PATH
export RACK_ENV=development
export RAILS_ENV=development
