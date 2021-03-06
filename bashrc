# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source file if it exists
include () {
    [[ -f $1 ]] && source $1
}

# Add paths to PATH
pathmunge () {
    if [[ -d $1 ]]; then
        if [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
            if [[ $2 = after ]]; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
        fi
    fi
}

# Source global definitions
include /etc/bashrc

# Don't use system-wide LS_COLORS
unset LS_COLORS

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    Host='@\h'
fi

# Add git branch
include ~/.git-prompt.sh
if [[ $? == 0 ]]; then
    if [ $(type -t __git_ps1) == function ]; then
        Branch='$(__git_ps1 " (%s)")'
    fi
fi
# Add completion for git
include ~/.git-completion.bash

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    Green='\[\e[01;32m\]'
    Blue='\[\e[01;34m\]'
    White='\[\e[00m\]'
fi

# Set prompt
PS1="${Green}\u${Host} ${Blue}\W${White}${Branch} \$ "

# Don't put quotation marks around file names containing white spaces
export QUOTING_STYLE=literal

# Unset variables
unset Host Branch
unset Green Blue White

# Custom scripts, etc...
pathmunge ${HOME}/bin

# Source kernel-specific bashrc
include ~/.bashrc.kernel

# Source custom bashrc
include ~/.bashrc.custom

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
include ~/.bash_aliases

# Function definitions.
include ~/.bash_functions
