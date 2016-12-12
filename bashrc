# enable coloring in terminal
export CLICOLOR=1

# paths
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:vendor/bin:$HOME/bin

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

# load git completion
source ~/.git-completion

# load prompt
source ~/.prompt

# added by travis gem
[ -f /Users/joey/.travis/travis.sh ] && source /Users/joey/.travis/travis.sh

# init rbenv
eval "$(rbenv init -)"

# add local bin dir to path
export PATH=./bin:$PATH
