# nginx-ldap-auth

Reference implementation of method for authenticating users on behalf of servers proxied by NGINX or NGINX Plus

## Documentation:

1. https://www.nginx.com/blog/nginx-plus-authenticate-users/

1. https://github.com/osixia/docker-openldap

## Dependencies

This assumes you have docker installed on your l/unix machine.
If you are missing the base images locally it will take a bit longer for you to pull them from docker hub before your containers are built.
Be patient.

## Getting Started

To setup this example as described by the nginx blog, you can execute either one of two example configurations.

2. Execute run-example.sh to build and smoke test a 2 container setup or
 - nginx-all
 - osixia/docker-openldap

2. You can execute run-example-multi.sh to build and smoke test a 4 container setup. Each container running a single process.
 - nginx
 - ldap-auth-daemon
 - backend
 - osixia/docker-openldap

<sub><sup>Thank you nginx for providing this example</sup></sub>