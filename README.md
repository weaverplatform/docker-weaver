# docker-weaver
Repo for all docker building/composing related to the weaver platform.

# Usage

## Complete stack
In the Docker Quickstart Terminal, run the following command in the root:
```
docker-compose up
``` 

This should set up a weaver-server image and all its dependent images.

## weaver-server-virtuoso image 
This repo also contains functionality to build the weaver-server-virtuoso image as available on Docker Hub. This functionality is not required for regular use, only for updating https://hub.docker.com/r/sysunite/weaver-server-virtuoso/.

In the weaver-server-virtuoso directory, run:
```
./build.sh <version>
``` 
Where version is correctly tagged github release. This will then create a weaver-server-virtuoso Docker image based on that version, and publish it on Docker Hub if logged in with a user that has the privileges to publish there.
