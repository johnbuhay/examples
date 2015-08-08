#!/bin/bash

docker build -t backend -f Dockerfile . && \
docker run -d --name backend -p 9000:9000 backend