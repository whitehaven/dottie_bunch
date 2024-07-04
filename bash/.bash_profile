# This script is just a switching box. I use three platforms at the moment, and this is how I tell betwen them.
# The termux one is pretty hacky; I'm working on better one
# | OS                         | $( uname ) | $( uname -p ) |
# | macOS                      | Darwin     | x86_64        |
# | Ubuntu                     | Linux      | x86_64        |
# | Android (by way of Termux) | Linux      | unknown       |

if [ $( uname ) = "Darwin" ]; then
   source $HOME/.bash_modules/osx
elif [ $( uname ) = "Linux" ]; then
  source $HOME/.bash_modules/linux
  if [ $( uname -p ) = "unknown" ]; then
    source $HOME/.bash_modules/termux
  fi
fi

source $HOME/.bash_modules/bash_generic

# IntelliShell
export INTELLI_HOME=/home/accrist/.local/share/intelli-shell
# export INTELLI_SEARCH_HOTKEY=\\C-@
# export INTELLI_LABEL_HOTKEY=\\C-l
# export INTELLI_BOOKMARK_HOTKEY=\\C-b
# export INTELLI_SKIP_ESC_BIND=0
alias intelli-shell="'$INTELLI_HOME/bin/intelli-shell'"
source "$INTELLI_HOME/bin/intelli-shell.sh"
