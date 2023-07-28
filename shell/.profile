# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/kitty.app/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=~/.surrealdb:$PATH
export PAHT=~/snap/bin
#PATH=$PATH:~/.local/kitty.app/bin


export GIT_EDITOR="nvim"
export GLFW_IM_MODULE=ibus=ibus

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 
. "$HOME/.cargo/env"


# riot api 
export RGAPI_KEY=GET_API_KEY_FOR_WATCHER

# Watcher
export WATCHER_NAME=HorryPortier6
export WATCHER_REGION=eune
#
# rust RAVEDUDE_PORT 
export RAVEDUDE_PORT=/dev/ttyUSB0

# phone 
export PHONE=ssh://GET_ssh_port_for_phon

# include Mycroft commands
# source ~/.profile_mycroft

export LANG=ja_jp.UTF-8
# requiers rust embeded setup
# source $HOME/export-esp.sh
