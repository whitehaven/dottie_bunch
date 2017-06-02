if [ $( uname ) = "Darwin" ]; then
   source $HOME/.bash_modules/osx
elif [ $( uname ) = "Linux" ]; then
  source $HOME/.bash_modules/linux
fi

source $HOME/.bash_modules/unix
