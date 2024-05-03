FROM debian:11

RUN apt-get update -y 
RUN apt-get upgrade -y

RUN apt-get install php7.4-fpm -y
RUN apt-get install php7.4-mysql -y
RUN apt-get install php7.4-mysqli -y
RUN apt-get install curl -y
RUN apt-get install mariadb-client -y

EXPOSE 9000

COPY ./tools/configure.sh /tmp/configure.sh
RUN chmod +x /tmp/configure.sh

RUN mkdir -p /var/www/html/
WORKDIR /var/www/html/

ENTRYPOINT ["/tmp/configure.sh"]
