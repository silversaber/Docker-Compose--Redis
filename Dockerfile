FROM redis:latest
RUN mkdir /var/log/redis

RUN mkdir /usr/local/etc/redis

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY init.sh /redis

WORKDIR /redis
CMD init.sh
