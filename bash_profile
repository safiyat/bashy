#!/usr/bin/env bash

###############################################################################
################################ .bash_profile ################################
###############################################################################

# .bash_profile is only sourced when bash(1) is started as an interactive
# login shell, or as a non-interactive shell with the --login option.
# This means that .bash_profile is great for commands that should run only once.

echo "Called .bash_profile."

export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";

if [ -d /opt/homebrew/bin ]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
fi
if [ -d /opt/homebrew/share/man ]; then
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi

# if [ -d /Users/safiyat/.bash_profile.d/ ]; then
# 	for bash_profile in $(find /Users/safiyat/.bash_profile.d -type f); do
# 		source ${bash_profile}
# 	done
# fi

#set -x

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#SCRIPT_DIR=$(greadlink -f $0)
SCRIPT_DIR=${HOME}/GitHub/bashy

# Required for discovering gmp.h when installing pycrypto.
# export "CFLAGS=-I/usr/local/include -L/usr/local/lib"
export "CFLAGS=-I/usr/local/include"
# export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS=-L/usr/local/opt/openssl/lib
#set +x

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
if [ -d /Library/Frameworks/Python.framework/Versions/2.7/bin ]; then
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
fi

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
if [ -d /Library/Frameworks/Python.framework/Versions/3.7/bin ]; then
    PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
fi

export PATH

# Setting PATH for Python 3.10
# The original version is saved in .bash_profile.pysave
if [ -d /Library/Frameworks/Python.framework/Versions/3.10/bin ]; then
    PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
fi
export PATH

for directory in ${SCRIPT_DIR}/X_profile.d/common ${SCRIPT_DIR}/X_profile.d/bash; do
	if [ -d ${directory} ]; then
		for bash_profile in $(find ${directory} -not -path '*/.*' -type f); do
			source ${bash_profile}
		done
	fi
done

if [ -f ${HOME}/.bashrc ]; then
	source ${HOME}/.bashrc
fi
