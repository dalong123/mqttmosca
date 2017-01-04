# Mosca
#
# VERSION 0.2.1

FROM mhart/alpine-node:4
MAINTAINER Matteo Collina <hello@matteocollina.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/

COPY ./ /usr/src/app/

RUN apk update && \
    apk add make gcc g++ python git && \
    npm install --unsafe-perm --production && \
    apk del make gcc g++ python git && \
    npm install -g  pm2  && \
    cd /usr/src/app && npm install

EXPOSE 3000

ENTRYPOINT ["node","/usr/src/app/app.js"]
