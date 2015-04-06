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

# Macports directory
MACPORTS_HOME=${HOME}/macports

# Add various Macports directories to PATH
pathmunge ${MACPORTS_HOME}/sbin
pathmunge ${MACPORTS_HOME}/bin
pathmunge ${MACPORTS_HOME}/libexec/gnubin

# Enable Virtualenvwrapper
python_version=2.7
virtualenv_clone=${MACPORTS_HOME}/bin/virtualenv-clone-${python_version}
virtualenvwrapper=${MACPORTS_HOME}/bin/virtualenvwrapper.sh-${python_version}
VIRTUALENVWRAPPER_VIRTUALENV_CLONE=${MACPORTS_HOME}/bin/${virtualenv_clone}
[ -f ${virtualenvwrapper} ] && source ${virtualenvwrapper}
unset python_version virtualenv_clone virtualenvwrapper

# Anaconda python distribution
pathmunge ${HOME}/anaconda/bin

# Custom scripts, etc...
pathmunge ${HOME}/bin

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
