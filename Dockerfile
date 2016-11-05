FROM buildpack-deps:jessie-curl

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    php5-curl \
    php5-fpm \
    php5-intl \
    php5-mongo \
    php5-mysqlnd \
    php5-readline \
    php5-xdebug \
    php5-xsl \
    unzip \
  && php5dismod xdebug \
  && rm -rf /var/lib/apt/lists/*

ENV DUMB_INIT_VERSION 1.2.0
RUN wget https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64.deb \
  && dpkg -i dumb-init_*.deb \
  && rm dumb-init_*.deb

ENV CONSUL_TEMPLATE_VERSION 0.16.0
RUN wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip \
  && unzip consul-template_*.zip -d /usr/bin \
  && rm consul-template_*.zip

ENV PHP_FPM_CONF_KEY php-fpm
ENV PHP_TIMEZONE ${PHP_TIMEZONE:-UTC}

COPY etc /etc/
COPY start.sh /

EXPOSE 9000
CMD ["/start.sh"]
