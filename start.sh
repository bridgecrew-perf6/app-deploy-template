#!/bin/bash
set -e
source .env

docker-compose up --build --no-start
docker-compose up --no-start
docker-compose restart
