#!/bin/bash

set -e

if [[ "$#" -lt 1 ]]; 
then
  echo "Usage: $0 <release tag> [tag]"
  echo "The release needs to be properly tagged on github"
  exit 1
fi;

VERSION="$1"
TAG="$2"
PROJECT="weaver-workbench-data"
SRC_LOC="https://github.com/weaverplatform/${PROJECT}/archive/v${VERSION}.tar.gz"

curl --location --output code.tar.gz "${SRC_LOC}"

tar -xzf code.tar.gz 

mv "${PROJECT}-${VERSION}" "code"

rm code.tar.gz
if [[ -z "${TAG}" ]];
then
  TAG="${VERSION}"
fi;

DOCKER_PACKAGE="sysunite/${PROJECT}:${TAG}"

echo "Building docker package: ${DOCKER_PACKAGE}"

docker build -t "${DOCKER_PACKAGE}" .

rm -rf code


echo "${DOCKER_PACKAGE} done building and ready to be distributed. "
echo "Test it, and after that run the command: docker push ${DOCKER_PACKAGE}"
echo "to publish the image."
