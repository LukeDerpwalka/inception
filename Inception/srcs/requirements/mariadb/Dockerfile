FROM debian:11

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y

COPY /tools/configure.sh /tmp/configure.sh
RUN chmod +x /tmp/configure.sh

ENTRYPOINT ["/tmp/configure.sh"]
