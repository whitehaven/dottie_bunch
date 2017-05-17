if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

function submerge()
{
	"$@" > /dev/null 2>&1 &
}

function push
{
    curl -s -F "token=aLR1xKbgFKrojR9nK2Nwh2HffKS7JA" \
    -F "user=u587gmq6kBmzEHpRgirFU5vXposA3P" \
    -F "title=AC-MBP" \
    -F "message=$1" https://api.pushover.net/1/messages.json
}

export EDITOR="/usr/local/bin/mate -w"
export VISUAL="/usr/bin/vim"

alias ls='ls -F'

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

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

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

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
alias lp='ll | less'       #  Page through less
alias lr='ll -R'           #  Recursive ls.
alias la='ls -AlhF'
alias ll='ls -lhF'
alias ld="ls -ldF"
alias l='ls'
alias c='clear'
alias x='exit'
alias q='exit'
alias rf='rm -rf'
alias mkdir='mkdir -pv'
alias h='history'

alias sl='ls'

function mcd
{
	mkdir $1 && cd $1;
}

#Jobs
alias j='jobs -l'

# Science
function sips-iphone_transparent
{
	echo "----> Do not double-apply this function!"
	echo "----> Resizing to 3000px max size (reduce file size 50%)"
	echo "====> sips $1 -Z 3000"
	sips "$1" -Z 3000
	echo "----> Resize operation successful"
}


# Brew verbosity environment variable (1 is on)
# export HOMEBREW_VERBOSE=1

# CD Assist
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

# Upgraded utilities
alias numFiles='echo $(ls -1 | wc -l)' 

alias h='history'
alias hgrep="history | grep"
alias j='jobs -l'

alias cp='cp -iv'
alias mv='mv -iv'

alias nowTime='nowdate +"%T'
alias nowDate='date +"%d-%m-%Y"'
alias Timestamp='date "+%F|%T"'

#Start calculator with math support
alias bc='bc -l'

# Use colored diff
alias diff='colordiff'

# Quicklook file
ql () { qlmanage -p "$*" >& /dev/null; }

# top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

#copy output of last command to clipboard
alias cl="fc -e -|pbcopy"

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#	memHogs: Find memory hogs
    alias memHogs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
    alias cpuHogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
	
# ipInfo: Get info on connections for en0
	alias ipInfo='ipconfig getpacket en0'    

	#   finderShowHidden:   Show hidden files in Finder
	#   finderHideHidden:   Hide hidden files in Finder
	#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

	#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
	#   ---------------------------------------------------------------------------------
   alias cleanupOpenWith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

function ac-full-upgrade
{
	set +e
	echo "-> homebrew upgrading:"
	brew update
	brew upgrade
	echo "-> homebrew-cask upgrading:"
	brew cu &&
	echo "-> homebrew* cleaning up:"
	brew prune
	brew cleanup -s --force
	echo "-> anaconda upgrading:"
	conda upgrade --all -y
	echo "-> anaconda cleaning up:"
	conda clean --all -y
	echo "-> pip upgrading (no clean at this time):"
	pip install -U youtube-dl
	echo ""
	echo "=> COMPLETED WITH 0 ERRORS <="
	echo "=> Upgraded homebrew, homebrew-cask, and root anaconda/pip environment."
	echo ""
	set -e
}


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


alias ac-updated_with_pip="conda list | grep pip | cut -d' ' -f1"


# added by Anaconda3 4.3.1 installer
export PATH="/Users/accrist/anaconda3/bin:$PATH"
