#!/bin/bash
set -e
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
mkdir -p etc/nginx/conf.d
touch etc/nginx/conf.d/$APP.conf

# volumes
mkdir -p docker/mysql/logs
mkdir -p docker/mysql/data

mkdir -p docker/server/data

mkdir -p docker/nginx/logs

# network
docker network create --driver bridge --subnet 172.19.0.0/16 --gateway 172.19.0.1 $APP-net
