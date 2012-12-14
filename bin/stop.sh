#! /usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/environment
for pidfile in ${RUN_DIR}/*;
do
    if [ -f $pidfile ]; then
        kill `cat $pidfile`
        if [ $? -eq 0 -o "$1" == "force" ]; then
            rm -rf $pidfile
        fi
    fi
done

${DIR}/status.sh