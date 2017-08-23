export PS1="\[\e]0;\w\a\]\[\033[38m\]\[\033[0;32m\]\$(~/.rvm/bin/rvm-prompt) \[\033[37m\]â€º\[\033[00m\] \[\033[01;36m\]\W \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]â€º \[\033[00m\]"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# utils
alias profile="subl ~/.bash_profile"
alias reprofile="source ~/.bash_profile"
alias webserver="python -m SimpleHTTPServer"
alias edit_bash="subl ~/.bash_profile"
alias source_bash="source ~/.bash_profile"
alias la="clear && ls -la"
alias rs="rails server"
alias mongo_server="mongod --dbpath /data"
alias workspace="cd ~/Documents/Workspace/"
alias back="cd .."
alias subl="open -a 'Sublime Text'"
alias docs="cd ~/Documents"
alias studies="cd ~/Documents/Studies"
alias workspace="cd ~/Documents/Workspace"
alias cs="clear && git status"
alias gcoa="git commit --amend --author='Adriana Silva <adriana45silva@gmail.com>'"


  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# keep history for each tab on terminal
export HISTFILE="$HOME/.bash_history_$TERM_SESSION_ID"
if [ ! -e $HISTFILE ]; then cp "$HOME/.bash_history" "$HISTFILE"; fi


function _line(){
echo "..........................................................................."
}

# Git helpers
function _sync() {
MASTER=$1;
WORK=$2;
ORIGIN=$3;

: ${MASTER:="master"}
: ${WORK:="work"}
: ${ORIGIN:="origin"}

git checkout $MASTER && _line && git pull $ORIGIN $MASTER && _line && git rebase $MASTER $WORK && _line
}

function _merge() {
MASTER=$1;
WORK=$2;
ORIGIN=$3;

: ${MASTER:="master"}
: ${WORK:="work"}
: ${ORIGIN:="origin"}

_sync $MASTER $WORK $ORIGIN

git checkout $MASTER && _line && git merge $WORK && _line && git push $ORIGIN $MASTER && _line && git checkout $WORK && _line
}

function sync() {
MASTER=$1;
WORK=$2;

: ${MASTER:="master"}
: ${WORK:="work"}

_sync $MASTER $WORK origin
}

function merge() {
MASTER=$1;
WORK=$2;

: ${MASTER:="master"}
: ${WORK:="work"}

_merge $MASTER $WORK origin
}

function hsync() {
MASTER=$1;
WORK=$2;

: ${MASTER:="master"}
: ${WORK:="work"}

_sync $MASTER $WORK heroku
}

function hmerge() {
MASTER=$1;
WORK=$2;

: ${MASTER:="master"}
: ${WORK:="work"}

_merge $MASTER $WORK heroku
}

source ~/.profile

