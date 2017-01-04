# Mosca
#
# VERSION 0.2.1

FROM daocloud.io/node:5
MAINTAINER dalongrong
 
COPY . /app  
WORKDIR /app

RUN npm install  --registry=https://registry.npm.taobao.org -g cnpm && \

    cnpm install  -g pm2 && \
    cnpm install 	
EXPOSE 3000
ENTRYPOINT ["pm2","start","app.js"]
