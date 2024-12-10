FROM ubuntu:24.04

WORKDIR /app

COPY . .
RUN apt-get update -y && apt-get install apache2 libapache2-mod-wsgi-py3 python3-pip python3-venv python3-dev -y
RUN python3 -m venv venv && . venv/bin/activate && pip3 install -r requirements.txt && pip3 install setuptools
COPY ./apache-config/httpd.conf /etc/apache2/apache2.conf
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
