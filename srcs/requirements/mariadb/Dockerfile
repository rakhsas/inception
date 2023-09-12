FROM debian:buster

RUN apt update && apt upgrade -y && apt clean

RUN apt install -y mariadb-server && apt clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./conf/conf.sql /

RUN mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

# RUN mysqld --initialize-insecure --user=mysql
RUN service mysql start && mysql < /conf.sql


EXPOSE 3306

# CMD /usr/bin/mysqld_safe
CMD ["mysqld_safe"]