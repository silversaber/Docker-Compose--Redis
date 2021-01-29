FROM redis:latest
RUN mkdir /var/log/redis

RUN mkdir /usr/local/etc/redis

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY init.sh ./

RUN chmod +x init.sh
