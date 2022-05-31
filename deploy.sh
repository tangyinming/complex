#!/bin/sh

ssh -o StrictHostkeyChecking=no travis@$DIGITAL_OCEAN_IP_ADDRESS << ENDSSH
    cd ~/apps/complex
    git fetch
    git pull
    docker-compose down
    echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
    source .env
    docker-compose up
ENDSSH