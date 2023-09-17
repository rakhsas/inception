FROM debian:12

RUN apt update && apt upgrade -y && apt clean

RUN apt install -y mariadb-server mariadb-client && apt clean

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

# RUN mysqld_safe --skip-grant-tables &
# RUN /setup.sh

COPY ./conf/setup.sh /
RUN chmod +x ./setup.sh

EXPOSE 3306

# CMD /usr/bin/mysqld_safe
# CMD ["mysqld", "--user=mysql"]
CMD ["bash", "./setup.sh"]


#CMD ["bash", "setup.sh"]
