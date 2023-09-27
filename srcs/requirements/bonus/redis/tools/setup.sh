#!/bin/sh

if [ -f "/etc/redis/redis1.conf.bak" ]
then
    echo "Redis Backup already exist"
else

    echo "COnfiguring Redis"

    cp /etc/redis/redis.conf /etc/redis/redis1.conf.bak
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

fi

redis-server --protected-mode no