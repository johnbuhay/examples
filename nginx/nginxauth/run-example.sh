#!/bin/bash

# docker build -t python-dep:2.7 -f Dockerfile.python-dep .
# docker build -t backend -f Dockerfile.backend .
# docker build -t ldapauthd -f Dockerfile.ldapauthd .
# docker build -t nginx:auth -f Dockerfile.nginx .
docker build -t nginx:all -f Dockerfile.all .

docker run -d --name ldap -p 389:389 -p 636:636 osixia/openldap
# docker run -d --name backend -p 9000:9000 backend
# docker run -d --name ldapauth -p 8888:8888 ldapauthd
# docker run -d --name nginx -p 80:8081 nginx:auth

docker run -d --name auth -p 80:8081 nginx:all

# docker exec auth python backend-sample-app.py &
# docker exec auth ./nginx-ldap-auth-daemon-ctl.sh start
# docker exec auth ps aux
# docker exec ldap ldapsearch -x -h localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin

curl -i http://192.168.59.103/
curl -i -d "username=john&password=buhay&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie: nginxauth=am9objpidWhheQ==; httponly" http://192.168.59.103
curl -i -d "username=admin&password=admin&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie: nginxauth=YWRtaW46YWRtaW4=; httponly" http://192.168.59.103
