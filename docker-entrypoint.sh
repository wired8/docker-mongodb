#!/bin/bash
set -e


if [ "${1:0:1}" = '-' ]; then
    set -- mongod "$@"
fi

if [ "$1" = 'mongod' ]; then
    params=''
    if [ -n "$MONGO_ADMIN"  ]; then
        if [ -n "$MONGO_PASSWORD" ]; then
            echo "Initializing MongoDb with Admin User"
            /tmp/scripts/initMongo.sh
            params="$params --auth"
        else
            echo "MONGO_ADMIN was set with empty password. Please set \$MONGO_PASSWORD"
            exit 1
        fi
    fi

    if [ -n "$MONGO_REST" ]; then
        params="$params --rest"
    fi

    numa='numactl --interleave=all'
    if $numa true &> /dev/null; then
        set -- $numa "$@" $params
    fi

    exec "$@" $params
fi

exec "$@"
