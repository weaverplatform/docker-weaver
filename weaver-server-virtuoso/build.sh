#!/bin/bash

set -e

if [[ "$1" -eq "--help" ]] || [ "$#" -eq 0 ]; 
then
  echo "Usage: $0 <project-name> <source_directory|release tag> [tag]"
  echo "  project-name: the github project name"
  echo "  source_directory: the local directory containing the project"
  echo "  release tag: a properly tagged version on github"
  echo "  tag: an override for the tag"
  echo ""
  echo "Examples: "
  echo "${0} weaver-server-virtuoso 0.2.2"
  echo "${0} weaver-server-virtuoso 0.2.2 0.2.2-fix1"
  echo "${0} weaver-server-virtuoso ~/weaver-server-virtuoso"
  exit 1
fi;

PROJECT="weaver-server-virtuoso"
VERSION="${2}"
TAG="${3}"

if [ -d "${VERSION}" ];
then
  echo "Since $VERSION is a directory, I'm going to assume the sources are in there."

  cp -r "${VERSION}" ./code 2>&1 || echo "Done"

  if [[ -z "${TAG}" ]];
  then
    TAG="$(hostname)"
  fi;
else
  echo "Pulling $VERSION from github."
  DLVERSION="v${VERSION}"

  SRC_LOC="https://github.com/weaverplatform/${PROJECT}/archive/${DLVERSION}.tar.gz"

  curl --location --output code.tar.gz "${SRC_LOC}"

  tar -xzf code.tar.gz 
  rm code.tar.gz

  mv "${PROJECT}-${VERSION}" "code"
 
  if [[ -z "${TAG}" ]];
  then
    TAG="${VERSION}"
  fi;
fi

DOCKER_PACKAGE="sysunite/${PROJECT}:${TAG}"

echo "Building docker package: ${DOCKER_PACKAGE}"

docker build -t "${DOCKER_PACKAGE}" .

rm -rf code

echo "${DOCKER_PACKAGE} done building and ready to be distributed. "
echo "Test it, and after that run the command: docker push ${DOCKER_PACKAGE}"
echo "to publish the image."
