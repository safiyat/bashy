#!/usr/bin/env bash

echo "Called .bashrc."

#set -x

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_DIR=/Users/safiyat/GitHub/bashy

for directory in ${SCRIPT_DIR}/Xrc.d/common ${SCRIPT_DIR}/Xrc.d/bash; do
	if [ -d ${directory} ]; then
		for bashrc in $(find ${directory} -type f ! -name '.*' | grep -v completion); do
			source ${bashrc}
		done

		# Completions go at the end.
		for bashrc in $(find ${directory} -type f ! -name '.*' | grep completion); do
			source ${bashrc}
		done
	fi
done
#set +x
