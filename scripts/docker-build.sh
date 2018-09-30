#!/bin/bash -e

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

for DOCKER_DIRECTORY in docker-*; do
    APP_NAME=$(echo "$DOCKER_DIRECTORY" | cut -d '-' -f2)
    pushd "$DOCKER_DIRECTORY"
    docker build -t "$DOCKER_USERNAME/$APP_NAME:$TRAVIS_COMMIT" .
    docker push "$DOCKER_USERNAME/$APP_NAME:$TRAVIS_COMMIT"
    popd
done
