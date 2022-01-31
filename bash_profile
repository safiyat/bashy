#!/usr/bin/env bash

###############################################################################
################################ .bash_profile ################################
###############################################################################

# .bash_profile is only sourced when bash(1) is started as an interactive
# login shell, or as a non-interactive shell with the --login option.
# This means that .bash_profile is great for commands that should run only once.

echo "Called .bash_profile."

# if [ -d /Users/safiyat/.bash_profile.d/ ]; then
# 	for bash_profile in $(find /Users/safiyat/.bash_profile.d -type f); do
# 		source ${bash_profile}
# 	done
# fi

#set -x

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#SCRIPT_DIR=$(greadlink -f $0)
SCRIPT_DIR=/Users/safiyat/GitHub/bashy

for directory in ${SCRIPT_DIR}/X_profile.d/common ${SCRIPT_DIR}/X_profile.d/bash; do
	if [ -d ${directory} ]; then
		for bash_profile in $(find ${directory} -type f); do
			source ${bash_profile}
		done
	fi
done

if [ -f /Users/safiyat/.bashrc ]; then
	source /Users/safiyat/.bashrc
fi

# Required for discovering gmp.h when installing pycrypto.
export "CFLAGS=-I/usr/local/include -L/usr/local/lib"
# export CPPFLAGS=-I/usr/local/opt/openssl/include
# export LDFLAGS=-L/usr/local/opt/openssl/lib
#set +x
