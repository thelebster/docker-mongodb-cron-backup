#!/bin/sh
set -e

DATE="$(date +"%m_%d_%Y-%H%M%S")"

DROPBOX_UPLOADER=/opt/dropbox_uploader/dropbox_uploader.sh

if ( [ -z "${MONGODB_USERNAME}" ] || [ -z "${MONGODB_PASSWORD}" ] );
then
  /usr/bin/mongodump \
  --host $MONGODB_HOST \
  --port $MONGODB_PORT \
  --db $MONGODB_DATABASE \
  --gzip \
  --archive=$DESTINATION_PATH/$DATE.gz
else
  /usr/bin/mongodump \
  --host $MONGODB_HOST \
  --port $MONGODB_PORT \
  --db $MONGODB_DATABASE \
  --username $MONGODB_USERNAME \
  --password $MONGODB_PASSWORD \
  --authenticationDatabase $MONGODB_AUTH_DATABASE \
  --gzip \
  --archive=$DESTINATION_PATH/$DATE.gz
fi

$DROPBOX_UPLOADER -f /config/dropbox_uploader.conf upload "$DESTINATION_PATH/$DATE.gz" /
