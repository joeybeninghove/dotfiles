# pretty colors in vim
export TERM=xterm-256color

# enable coloring in terminal
export CLICOLOR=1

# paths
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$HOME/.composer/vendor/bin:bin:vendor/bin:$HOME/bin:$PATH

# vim for life
export EDITOR='vim'

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

# load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

. `brew --prefix`/etc/profile.d/z.sh

# load aliases
source ~/.aliases

# load git completion
source ~/.git-completion

# load prompt
source ~/.prompt

ulimit -n 65536
ulimit -u 2048

eval "$(direnv hook bash)"
