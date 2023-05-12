
FROM ubuntu:18.04

MAINTAINER rockyimman

RUN apt-get update
RUN apt-get install -y nginx
ADD index.html /usr/share/nginx/html/index.html

# Install supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD docker-resource/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

# Set supervisor to manage container processes
ENTRYPOINT ["/usr/bin/supervisord"]