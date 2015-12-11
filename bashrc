# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
if [ -f ${HOME}/.git-prompt.sh ]; then
    . ${HOME}/.git-prompt.sh
    Branch='$(__git_ps1 " (%s)")'
fi

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

# Unset variables
unset Host Branch
unset Green Blue White

if [[ -f ~/.bashrc.local ]]; then
    . ~/.bashrc.local
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
