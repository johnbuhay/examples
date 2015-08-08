#!/bin/bash

docker build -t nginx:auth -f Dockerfile . && \
docker run -d --name nginx -p 80:8081 nginx:auth