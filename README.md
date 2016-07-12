# docker-weaver
Repo for all docker building/composing related to the weaver platform.

# Usage

## Complete stack
In the Docker Quickstart Terminal, run the following command in the root:
```
docker-compose up
``` 

This should pull and start a weaver-server-virtuoso image and all its dependent images.

## Building an image
This repo also contains functionality to build the docker images as available on Docker Hub. This functionality is not required for regular use, only for updating images on dockerhub, for instance when a new https://hub.docker.com/r/sysunite/weaver-server-virtuoso/ is available.

Run:
```
./build.sh <project-name> <version>
``` 

For example:
```
./build.sh weaver-server-virtuoso 0.2.2
```
Where version is correctly tagged github release (see below). This will then create a weaver-server-virtuoso Docker image based on that version, and publish it on Docker Hub if logged in with a user that has the privileges to publish there.

### Tagging weaver-server-virtuoso for building an image

In order for the build script to be able to find a version of the virtuoso weaver-server, it needs to be tagged using npm, and that tag needs to be pushed to github. Following are the commands to do this on the console:
```
npm version patch
git push --tags
```
For a major or minor version, change the npm version argument.


### Building a development version image

Sometimes you may want to create a docker image based on the current code you have on your local system but this isn't completely ready for release for some reason. The build script supports this in the following way:

```
./build.sh <project-name> <source directory>
```

For example:
```
./build.sh weaver-server-virtuoso ~/weaver-server-virtuoso
```

This will create an image based on that checkout with a tag based on your hostname to denote an unofficial release.
