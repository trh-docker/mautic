FROM quay.io/spivegin/php7:7.3

ADD files/Caddy/Caddyfile /opt/caddy/
ADD files/php/ /etc/php/7.3/fpm/pool.d/
WORKDIR /opt/tlm/html
ADD https://github.com/mautic/mautic/releases/download/3.0.0/3.0.0.zip /opt/tlm/html/

RUN unzip 3.0.0.zip && rm 3.0.0.zip  &&\
    chown -R www-data:www-data .

EXPOSE 80

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/bin/entry.sh"]