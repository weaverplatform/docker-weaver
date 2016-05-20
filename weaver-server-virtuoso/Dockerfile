FROM node:4

# Docker nodejs creation following 
# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

RUN apt-get update && apt-get install -y openjdk-7-jdk netcat

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY code/package.json /usr/src/app
RUN npm install

RUN npm install -g coffee-script

COPY code /usr/src/app

EXPOSE 9487

CMD echo 'Waiting for virtuoso on ' ${VIRTUOSO_HOST} ':' ${VIRTUOSO_PORT} && while ! nc -w 1 -z ${VIRTUOSO_HOST} ${VIRTUOSO_PORT}; do sleep 0.1; done && npm start
