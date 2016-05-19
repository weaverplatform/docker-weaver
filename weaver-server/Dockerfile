FROM node:6.2

# Docker nodejs creation following 
# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

RUN apt-get update && apt-get install -y openjdk-7-jdk

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY code/package.json /usr/src/app
RUN npm install

RUN npm install -g coffee-script

COPY code /usr/src/app

EXPOSE 9487

ENV REDIS_URL 192.168.99.100:6379

CMD [ "npm", "start" ]
