FROM debian:11

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl

EXPOSE 443

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /run/nginx

RUN openssl req -x509 -sha256 -newkey rsa:4096 -days 365 -nodes \
       -out /etc/nginx/ssl/ssl_final_cert.crt \
       -keyout /etc/nginx/ssl/ssl_priv_key.key \
       -subj "/CN=nginx"

COPY ./tools/configure.sh /tmp/configure.sh 
RUN chmod +x /tmp/configure.sh

ENTRYPOINT ["/tmp/configure.sh"]
