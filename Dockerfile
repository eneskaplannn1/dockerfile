FROM nginx:latest

LABEL maintainer="eneskaplan" 

ENV KULLANICI=Enes

ARG RENK

RUN apt-get update -y && apt-get install -y  htop curl wget

WORKDIR /temp

ADD https://wordpress.org/latest.tar.gz .

WORKDIR /usr/share/nginx/html

COPY ./html/${RENK} .


HEALTHCHECK --interval=5s --timeout=30s --start-period=5s --retries=3 CMD curl http://localhost/ || exit 1


CMD [ "./script.sh" ]