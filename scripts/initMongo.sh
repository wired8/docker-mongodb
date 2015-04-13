#!/bin/bash
gosu mongodb mongod --smallfiles --nojournal &

RET=1
if [ ! -f '/opt/mongo_init.sema' ]; then
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MongoDB service startup"
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

echo "=> Creating Admin: $MONGO_ADMIN with Pass: $MONGO_PASSWORD in MongoDB"
mongo admin --eval "db.createUser({user: '$MONGO_ADMIN', pwd: '$MONGO_PASSWORD', roles: [ 'root' ]});"

if [ -n "$MONGO_DBS" ]; then
echo "=> Creating Admin User in given databases"
for DB in ${MONGO_DBS}; do
    mongo $DB --eval "db.createUser({user: '$MONGO_ADMIN', pwd: '$MONGO_PASSWORD', roles: [ 'dbOwner' ]});"
done
fi

mongo admin --eval "db.shutdownServer();"
echo "=> Done!"

touch /opt/mongo_init.sema

fi

