#!/bin/sh
set -e

if ( [ -z "${OAUTH_ACCESS_TOKEN}" ] );
then
  echo 'Access token is required.'
else
  mkdir -p /config 
  touch /config/dropbox_uploader.conf
  echo "OAUTH_ACCESS_TOKEN=${OAUTH_ACCESS_TOKEN}" > /config/dropbox_uploader.conf
fi

exec "$@"
