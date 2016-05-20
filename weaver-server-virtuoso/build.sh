#!/bin/bash

set -e

if [[ "$#" -ne 1 ]]; 
then
  echo "Usage: $0 <release tag>"
  echo "The release needs to be properly tagged on github"
  exit 1
fi;

VERSION="$1"
PROJECT="weaver-server-virtuoso"
SRC_LOC="https://github.com/weaverplatform/${PROJECT}/archive/v${VERSION}.tar.gz"

curl --location --output code.tar.gz "${SRC_LOC}"

tar -xzf code.tar.gz 

mv "${PROJECT}-${VERSION}" "code"

rm code.tar.gz

docker build -t "sysunite/${PROJECT}:${VERSION}" .

rm -rf code
