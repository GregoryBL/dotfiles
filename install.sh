#/usr/bin/bash

set -xe

# Copy all homedirectory files into $HOME
cp -r ./homedir/. $HOME

# Set up some emacs directories
mkdir -p $HOME/.emacs.d
mkdir -p $HOME/.emacs.autosaves

# Copy the shell load files
cp -r ./loads $HOME/

exec $SHELL

set +xe
