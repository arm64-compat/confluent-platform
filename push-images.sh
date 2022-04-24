#!/bin/bash -x

source ./set-env.sh

find $1 -type f -name '*Dockerfile.ubi8' -exec dirname {} \; | xargs -I{} sh -c '$MVN -f $1/pom.xml dockerfile:push' -- {}
