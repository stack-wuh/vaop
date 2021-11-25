ARG UPSTREAM_TAG=4.8-php8.0-alpine

# https://hub.docker.com/r/phpswoole/swoole
FROM phpswoole/swoole:$UPSTREAM_TAG

RUN apk --update add \
        wget \
        curl \
        build-base \
        composer \
        nodejs \
        npm \
        libmcrypt-dev \
        libxml2-dev \
        pcre-dev \
        zlib-dev \
        autoconf \
        oniguruma-dev \
        openssl \
        openssl-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        jpeg-dev \
        libpng-dev \
        imagemagick-dev \
        imagemagick \
        postgresql-dev \
        libzip-dev \
        gettext-dev \
        libxslt-dev \
        libgcrypt-dev && \
    pecl channel-update pecl.php.net && \
    pecl install mcrypt redis && \
    docker-php-ext-install \
        mysqli \
        mbstring \
        pdo \
        pdo_mysql \
        tokenizer \
        xml \
        pcntl \
        bcmath \
        pdo_pgsql \
        zip \
        intl \
        gettext \
        soap \
        sockets \
        xsl && \
    docker-php-ext-configure gd --with-freetype=/usr/lib/ --with-jpeg=/usr/lib/ && \
    docker-php-ext-install gd && \
    docker-php-ext-enable redis && \
    rm -rf /tmp/pear && \
    rm /var/cache/apk/*

WORKDIR /var/www/html

COPY . /var/www/html

RUN mkdir -p /var/www/html/storage/logs/ && \
    chown -R www-data:www-data /var/www/html && \
    rm -rf tests/ .git/ .github/ *.md && \
    rm -rf vendor/*/test/ vendor/*/tests/* && \
    rm -rf node_modules/