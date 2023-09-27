FROM debian:12

RUN apt update && apt upgrade

RUN apt -q install -y mariadb-server && apt clean


COPY ./tools/setup.sh /
RUN chmod +x ./setup.sh

EXPOSE 3306

CMD ["bash", "./setup.sh"]

