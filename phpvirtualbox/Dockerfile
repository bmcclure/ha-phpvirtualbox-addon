# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG PHP_VERSION="~7.4"
ARG PHPVIRTUALBOX_VERSION=cf82d58f26ed82d3f7f4b5ba5e80f8754ee48c2f

RUN \
    apk add --no-cache \
        libxml2=~2.9 \
        libxml2-dev=~2.9 \
        nginx=~1.20 \
        php7=$PHP_VERSION \
        php7-fpm=$PHP_VERSION \
        php7-json=$PHP_VERSION \
        php7-opcache=$PHP_VERSION \
        php7-openssl=$PHP_VERSION \
        php7-soap=$PHP_VERSION \
        php7-simplexml=$PHP_VERSION \
    && mkdir -p /var/www \
    && curl -L -s \
        "https://github.com/phpvirtualbox/phpvirtualbox/archive/${PHPVIRTUALBOX_VERSION}.tar.gz" \
        | tar zxvf - -C /var/www \
    && rm -rf /var/www/phpvirtualbox \
    && mv /var/www/phpvirtualbox-${PHPVIRTUALBOX_VERSION} /var/www/phpvirtualbox \
    && rm -rf \
        /tmp/* \
        /etc/nginx \
        /var/www/pax_global_header \
        /var/www/phpvirtualbox/.htaccess \
        /var/www/phpvirtualbox/.dockerignore \
        /var/www/phpvirtualbox/.gitignore \
        /var/www/phpvirtualbox/config.php-example \
        /var/www/phpvirtualbox/CHANGELOG.txt \
        /var/www/phpvirtualbox/docker-compose.yml \
        /var/www/phpvirtualbox/Dockerfile \
        /var/www/phpvirtualbox/README.md \
        /var/www/phpvirtualbox/recovery.php-disabled \
        /var/www/phpvirtualbox/packaging

COPY rootfs /

RUN \
    chmod a+x /etc/cont-init.d/phpvirtualbox.sh \
    /etc/services.d/nginx/* \
    /etc/services.d/php-fpm/*
