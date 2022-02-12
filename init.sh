#!/bin/bash
set -e
set -x

source .env

echo "APP: "$APP
if [[ -z "${APP}" ]]; then
  exit 1
fi

# src
mkdir -p src/web/$APP-web
mkdir -p src/server/$APP-server

# configs
mkdir -p etc/server
# nginx
mkdir -p etc/nginx/conf.d
touch etc/nginx/conf.d/app.conf

# swagger
htpasswd -c etc/nginx/conf.d/swagger.passwd $SWAGGER_AUTH_USERNAME $SWAGGER_AUTH_PASSWORD

# volumes
mkdir -p docker/mysql/logs
mkdir -p docker/mysql/data

mkdir -p docker/server/data

mkdir -p docker/nginx/logs

# network
docker network create --driver bridge --subnet $IP_MASK/16 --gateway $IP_GATEWAY $APP-net
