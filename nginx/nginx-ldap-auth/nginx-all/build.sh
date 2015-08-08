#!/bin/bash

docker build -t nginx:all -f Dockerfile . && \
docker run -d --name auth -p 80:8081 nginx:all