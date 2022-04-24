#!/bin/bash

DOCKER_DIR=$(dirname $1)
DOCKER_DIR=$DOCKER_DIR/pom.xml

ARTIFACT_ID=$(sh -c "$MVN_HELP -f common-docker/pom.xml -Dexpression=project.artifactId")

DOCKER_IMAGE=$DOCKER_REGISTRY/$DOCKER_REPOSITORY/confluentinc/$ARTIFACT_ID

MANIFEST_NAME=$DOCKER_IMAGE:$CONFLUENT_VERSION
ARM_IMAGE=$MANIFEST_NAME-arm64
AMD_IMAGE=$MANIFEST_NAME-amd64

docker manifest create $MANIFEST_NAME $ARM_IMAGE $AMD_IMAGE
docker manifest push $MANIFEST_NAME