FROM python:2.7


EXPOSE 8888

RUN apt-get update && apt-get install -y --no-install-recommends libldap2-dev libsasl2-dev && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir python-ldap

COPY nginx-ldap-auth-daemon.py /usr/src/
COPY nginx-ldap-auth-daemon-ctl.sh /usr/src/

WORKDIR /usr/src/
CMD ["python", "nginx-ldap-auth-daemon.py"]