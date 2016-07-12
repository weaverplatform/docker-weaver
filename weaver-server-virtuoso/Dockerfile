FROM node:0.12

# Docker nodejs creation following 
# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

RUN apt-get update && apt-get install -y openjdk-7-jdk netcat

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY code /usr/src/app
RUN npm install --quiet
RUN npm install --quiet -g coffee-script

RUN coffee -o lib -c src 

EXPOSE 9487

CMD sleep ${STARTUP_SLEEP-3} && echo 'Waiting for redis ' && while ! nc -w 1 -z ${REDIS_HOST} ${REDIS_PORT}; do sleep 0.1; done && echo 'Waiting for virtuoso on ' ${VIRTUOSO_HOST} ':' ${VIRTUOSO_CHECK_PORT} && while ! nc -w 1 -z ${VIRTUOSO_HOST} ${VIRTUOSO_PORT}; do sleep 0.1; done && sleep ${INTERMEDIATE_SLEEP-10} && npm start
