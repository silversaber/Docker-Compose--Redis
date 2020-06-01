# nginx/Dockerfile
FROM ubuntu:18.04
MAINTAINER aglide100@gmail.com

# install nginx & http ext module
RUN apt-get update && apt-get install -y nginx-extras libnginx-mod-http-dav-ext
# install for htpaswwd
RUN apt-get install -y apache2-utils

RUN rm -rf /etc/nginx/sites-enabled/default

RUN mkdir -p /var/webdav/file && mkdir -p /var/webdav/client_temp
RUN chown www-data:root -R /var/webdav
RUN chmod -R 777 /var/webdav

COPY ../nginx.conf /etc/nginx/nginx.conf

RUN  mkdir -p /etc/nginx/conf.d
#COPY webdav.conf /etc/nginx/conf.d/
#COPY proxy.conf /etc/nginx/conf.d/

RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled

COPY ../proxy.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/proxy.conf

COPY ../entrypoint.sh .
RUN chmod +x /entrypoint.sh

WORKDIR /etc/nginx 
#CMD nginx -g "daemon off;"
CMD ../entrypoint.sh && nginx -g "daemon off;"
