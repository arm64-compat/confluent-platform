#!/bin/bash -x

source ./set-env.sh $1

$MVN -f $1/pom.xml -Pdocker clean package
