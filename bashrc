#!/usr/bin/env bash

echo "Called .bashrc."

#set -x

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_DIR=/Users/safiyat/GitHub/bashy

for directory in ${SCRIPT_DIR}/Xrc.d/common ${SCRIPT_DIR}/Xrc.d/bash; do
	if [ -d ${directory} ]; then
		for bashrc in $(find ${directory} -type f ! -name '.*'); do
			source ${bashrc}
		done
	fi
done
#set +x
