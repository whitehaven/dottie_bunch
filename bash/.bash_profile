if [ $( uname ) = "Darwin" ]; then
   source $HOME/.bash_modules/osx
elif [ $( uname ) = "Linux" ]; then
  source $HOME/.bash_modules/linux
  if [ $( uname -p ) = "unknown" ]; then
    source $HOME/.bash_modules/termux
  fi
fi

source $HOME/.bash_modules/bash_generic
