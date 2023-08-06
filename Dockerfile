FROM nginx
LABEL maintainer="Enes KAPLAN k88817029@gmail.com" 
ENV KULLANICI="Enes"
ARG RENK
RUN apt-get update  && apt-get install -y  htop curl wget
WORKDIR /temp
ADD https://wordpress.org/latest.tar.gz .
WORKDIR /usr/share/nginx/html
COPY html/${RENK} .
EXPOSE 80
HEALTHCHECK --interval=5s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost/ || exit 1
RUN chmod +x script.sh
CMD rm index.html;sed -e s/KULLANICI/"$KULLANICI"/ temp.html > index1.html; sed -e s/HOSTNAME/"$HOSTNAME"/ index1.html > index.html ; nginx -g 'daemon off;'