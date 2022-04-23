#!/bin/bash -x

find $BUILD_DIR -type f -name '*Dockerfile.ubi8' -exec dirname {} \; | xargs -I{} sh -c '$MVN -f $1/pom.xml dockerfile:push' -- {}
