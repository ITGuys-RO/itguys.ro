FROM php:7.4-fpm
WORKDIR "/var/www"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        build-essential \
        git \
        libmcrypt-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libmagickwand-dev \
        libzip-dev \
        libpq-dev \
        unzip \
        zip \
        zlib1g-dev \
        netcat \
        cron \
        supervisor \
        nano \
        sudo \
        exiftool

RUN pecl install \
        imagick \
        mcrypt \
        uuid \
        xdebug

RUN docker-php-ext-configure gd \
        --with-jpeg=/usr/include/ \
        --with-freetype=/usr/include/

RUN docker-php-ext-install \
        bcmath \
        bz2 \
        gd \
        pdo \
        pdo_mysql \
        zip \
        exif

RUN docker-php-ext-enable \
        imagick \
        mcrypt \
        uuid \
        xdebug \
        exif

RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install csfixer
RUN curl -L https://cs.symfony.com/download/php-cs-fixer-v2.phar -o php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 9000
ENTRYPOINT ["entrypoint.sh"]
