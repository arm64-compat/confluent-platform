#!/bin/bash -x

DOCKER_DIR=$1
shift

source ./set-env.sh $DOCKER_DIR

$MVN -f $DOCKER_DIR/pom.xml -Pdocker clean package $@
