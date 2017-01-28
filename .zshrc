echo "Logging onto $HOSTNAME as $(whoami)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Source all of the files in $HOME/dotfiles
if [[ -e $HOME/dotfiles ]] ; then
  for file in $HOME/dotfiles/.*; do
    if [ file == $HOME/dotfiles/.zshrc ] ; then continue; fi
    source file
  done
fi

# Source all files in $HOME/loads
if [[ -e $HOME/loads ]] ; then
  for file in $HOME/loads/*; do
    source file
  done
fi
