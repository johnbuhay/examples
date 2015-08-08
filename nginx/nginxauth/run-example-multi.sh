#!/bin/bash


docker run -d --name ldap -p 389:389 -p 636:636 osixia/openldap
echo "wait 5 for ldap" && sleep 5
docker exec ldap ldapsearch -x -h localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin

cd backend && ./build.sh && cd -
cd ldapauthd && ./build.sh && cd -
cd nginx && ./build.sh && cd -

curl -i http://192.168.59.103/
curl -i -d "username=john&password=buhay&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie: nginxauth=am9objpidWhheQ==; httponly" http://192.168.59.103

curl -i -d "username=admin&password=admin&target=/login"  -X POST http://192.168.59.103/login
curl -i -H "Cookie: nginxauth=YWRtaW46YWRtaW4=; httponly" http://192.168.59.103

curl -i -H "Cookie: nginxauth=YWRtaW46YWRtaW4=; httponly" http://192.168.59.103 | grep "Hello, world!" || printf "\nTest failed." && printf "\nTest passed!"