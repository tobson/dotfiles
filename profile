#!/bin/bash

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

pathmunge () {
    if [ -d "$1" ]; then
        if [[ ! "$PATH" =~ "(^|:)$1(:|$)" ]]; then
            if [ "$2" = "after" ]; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
}

# Ruby gems
if which ruby > /dev/null && which gem > /dev/null; then
    pathmunge "$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
fi

# Custom scripts, etc...
pathmunge ${HOME}/bin

# Set default options for grep
export GREP_OPTIONS='-I'

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
