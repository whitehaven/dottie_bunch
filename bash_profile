# Set up bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# add git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function submerge()
{
	"$@" > /dev/null 2>&1 &
}

export EDITOR="/usr/local/bin/mate -w"
export VISUAL="/usr/bin/vim"

#   ---------------------------------------
#   IP
#   ---------------------------------------
getExternalIP()
{
	wget -qO- http://ipecho.net/plain;
	echo;
}
getLocalIP()
{
	ipconfig getifaddr en0;
}

# Is function because of quoting behavior - wouldn't fit into an alias right.
function getGatewayIP
{
	route -n get default | grep gateway: | awk '{gsub("    gateway: ","");print}';
}

function getMACAddress
{
	ifconfig en0 | grep ether | awk '{gsub("\tether ","");print}';
}

# Auto-restart download
alias wget='wget -c'

#   ---------------------------------------
#   Terminal Directories
#   ---------------------------------------


cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

#   ---------------------------------------
#   File Management
#   ---------------------------------------

# See http://www.shellperson.net/using-sudo-with-an-alias/
alias sudo='sudo '

# Shortcuts
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias l='ls'
alias ls='ls -F'
alias ll='ls -lhF'
alias lp='ll | less'       #  Page through less
alias lr='ll -R'           #  Recursive ls.
alias la='ls -AlhF'
alias ld="ls -ldF"
alias c='clear'
alias x='exit'
alias mkdir='mkdir -pv'
alias h='history'

# make directory and jump in
function mcd
{
	mkdir $1 && cd $1;
}

# cd assist
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Emergency Shutdown
alias pmset-shutdownnow='sudo /sbin/shutdown -h now'

alias cp='cp -iv'
alias mv='mv -iv'

alias nowTime='nowdate +"%T'
alias nowDate='date +"%d-%m-%Y"'
alias Timestamp='date "+%F|%T"'

#Start calculator with floating-point math support
alias bc='bc -l'

# Use colored diff
alias diff='colordiff'

# Quicklook file
ql () { qlmanage -p "$*" >& /dev/null; }

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

#copy output of last command to clipboard
alias cl="fc -e -|pbcopy"

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupOpenWith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# prompt that shows taskwarrior context (and reminds to set context by just showing t:context when none selected)
export PS1="\u@\h \w [t:\$(task context show | cut -d' ' -f2 | tr -d \"'\")=\$(task +PENDING count)|in=\$(task +in +PENDING count)] -> "

# taskwarrior shortcuts
alias t='task '
alias tn='task next'
alias trd='task ready'
alias tc='task context '
alias tcn='task context none'
alias ta='task add '
alias ts='task sync'

alias tref='task sync; clear; task ready;'

# ultra-fast inbox, auto-adds tag on the way in
alias in='task add +in'


# find packages updated by pip instad of conda
alias ac-updated_with_pip="conda list | grep pip | cut -d' ' -f1"

# added by Anaconda3 4.3.1 installer
export PATH="/Users/accrist/anaconda3/bin:$PATH"

