#!/bin/bash -x

export DOCKER_REGISTRY=${DOCKER_REGISTRY:=ghcr.io}
export DOCKER_REPOSITORY=${DOCKER_REPOSITORY:=arm64-compat}
export ZULU_JDK_VERSION=${ZULU_JDK_VERSION:=11.0.15-1}

BUILD_ARCH=${TRAVIS_CPU_ARCH:=arm64}

export MVN="mvn -s settings.xml"
export MVN_HELP="$MVN -q org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -DforceStdout=true"
export CONFLUENT_VERSION=$(sh -c "$MVN_HELP -f common-docker/pom.xml -Dexpression=project.version")
export CONFLUENT_REPO_VERSION=$(sh -c "echo $CONFLUENT_VERSION | rev | cut -d. -f2- | rev")
export CONFLUENT_PACKAGES_REPO="https://packages.confluent.io/rpm/$CONFLUENT_REPO_VERSION"
export DOCKER_TAG="$CONFLUENT_VERSION-$BUILD_ARCH"
export MVN="$MVN -Ddockerfile-maven-plugin.version=1.4.14-SNAPSHOT"
export MVN="$MVN -Ddocker.registry=$DOCKER_REGISTRY/$DOCKER_REPOSITORY/"
export MVN="$MVN -DCONFLUENT_VERSION=$CONFLUENT_VERSION"
export MVN="$MVN -Dubi.zulu.openjdk.version=$ZULU_JDK_VERSION"
export MVN="$MVN -DCONFLUENT_PACKAGES_REPO=$CONFLUENT_PACKAGES_REPO"
export MVN="$MVN -Ddocker.tag=$DOCKER_TAG"

echo "CONFLUENT_VERSION=$CONFLUENT_VERSION"
echo "CONFLUENT_PACKAGES_REPO=$CONFLUENT_PACKAGES_REPO"
echo "DOCKER_TAG=$DOCKER_TAG"

echo "MVN=$MVN"
