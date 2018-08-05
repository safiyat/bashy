#! /usr/bin/env bash

function if_command_exists(){
    program=$1

    if command -v $program > /dev/null 2>&1; then
        echo Yes.
    fi
}

function common_env(){

    export LC_ALL=C

    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

    # Aria
    if [ $(if_command_exists aria2c) ]; then
        alias aria="aria2c --quiet-true &"
    fi

    # Emacs
    if [ $(if_command_exists emacs) ]; then
        export EDITOR="EMACS"
    fi


}

function env_for_mac(){
    echo
}

function env_for_linux(){
    echo
}
