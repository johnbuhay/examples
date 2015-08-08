#!/bin/bash

docker build -t ldapauthd -f Dockerfile . && \
docker run -d --name ldapauth -p 8888:8888 ldapauthd