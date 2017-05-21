FROM node:6.10.3-alpine

CMD [ "npm", "start" ]
EXPOSE 3000

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
VOLUME /var/log/app


COPY . /usr/src/app
