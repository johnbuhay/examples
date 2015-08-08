#!/bin/bash

python backend-sample-app.py &
./nginx-ldap-auth-daemon-ctl.sh start

exec service nginx start