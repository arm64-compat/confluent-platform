#!/bin/bash -x

source ./set-env.sh

$MVN -f $1/pom.xml -Pdocker clean package
