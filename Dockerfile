FROM php:8.4-cli

RUN apt-get update \
    && apt-get install -y \
        git \
        unzip \
        pkg-config \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
        libxml2-dev \
        libzip-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install \
        bcmath \
        exif \
        gd \
        intl \
        pcntl \
        pdo_mysql \
        soap \
        zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app
