# docker-weaver
Repo for all docker building/composing related to the weaver platform.

# Status
In development, broken. Waiting for a publicly available weaver-server-virtuoso.

# Usage

## Complete stack
In the Docker Quickstart Terminal, run the following command in the root:
```
docker-compose up
``` 

This should set up a weaver-server image and all its dependent images.

## weaver-server image 
In the weaver-server directory, run:
```
./build.sh <version>
``` 
Where version is correctly tagged github release. This will then create a weaver-server Docker image based on that version.
