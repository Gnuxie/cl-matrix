#!/bin/bash

datadir=/tmp/data

docker stop synapse
docker rm synapse

docker run -it --rm \
    -v $datadir:/data \
    -e SYNAPSE_SERVER_NAME=localhost \
    -e SYNAPSE_REPORT_STATS=no \
    matrixdotorg/synapse:latest generate

docker run -d --name synapse \
    -v $datadir:/data \
    -p 8008:8008 \
    matrixdotorg/synapse:latest

sleep 1

docker exec synapse register_new_matrix_user -u luna -p lunapass -c /data/homeserver.yaml --no-admin http://localhost:8008
docker exec synapse register_new_matrix_user -u coolmod -p coolmodpass -c /data/homeserver.yaml --no-admin http://localhost:8008
docker exec synapse register_new_matrix_user -u user -p pass -c /data/homeserver.yaml --no-admin http://localhost:8008

docker exec synapse register_new_matrix_user -u ci-1 -p pass -c /data/homeserver.yaml --no-admin http://localhost:8008
docker exec synapse register_new_matrix_user -u ci-2 -p pass -c /data/homeserver.yaml --no-admin http://localhost:8008

echo "ok!"
