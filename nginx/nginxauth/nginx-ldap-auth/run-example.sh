#!/bin/bash

docker build -t backend -f Dockerfile.backend .
docker build -t nginx:auth -f Dockerfile.nginx .

docker run -d --name ldap -p 389:389 -p 636:636 osixia/openldap
docker run -d --name auth -p 80:8081 nginx:auth

docker exec auth python backend-sample-app.py &
docker exec auth ./nginx-ldap-auth-daemon-ctl.sh start
docker exec auth ps aux

curl -i http://192.168.59.103
curl -i -d "username=john&password=buhay&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie nginxauth=am9objpidWhheQ==; httponly" http://192.168.59.103
curl -i -d "username=admin&password=admin&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie nginxauth=YWRtaW46YWRtaW4=; httponly" http://192.168.59.103
