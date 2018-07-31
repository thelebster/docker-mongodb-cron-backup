#!/bin/sh
set -e

# BASH_PROFILE=/root/.bash_profile

# touch $BASH_PROFILE
# echo "export MONGODB_HOST=${MONGODB_HOST}" >> $BASH_PROFILE
# echo "export MONGODB_PORT=${MONGODB_PORT}" >> $BASH_PROFILE
# echo "export MONGODB_DATABASE=${MONGODB_DATABASE}" >> $BASH_PROFILE
# echo "export MONGODB_USERNAME=${MONGODB_USERNAME}" >> $BASH_PROFILE
# echo "export MONGODB_PASSWORD=${MONGODB_PASSWORD}" >> $BASH_PROFILE
# echo "export MONGODB_AUTH_DATABASE=${MONGODB_AUTH_DATABASE}" >> $BASH_PROFILE
# echo "export DESTINATION_PATH=${DESTINATION_PATH}" >> $BASH_PROFILE

if ( [ -z "${OAUTH_ACCESS_TOKEN}" ] );
then
  echo 'Access token is required.'
else
  mkdir -p /config 
  touch /config/dropbox_uploader.conf
  echo "OAUTH_ACCESS_TOKEN=${OAUTH_ACCESS_TOKEN}" > /config/dropbox_uploader.conf
fi

exec "$@"
