FROM php:8.2-fpm

RUN apt-get update -y \
    && apt-get install -y \
    postgresql-client \
    openssl \
    zip \
    unzip \
    git \
    curl \
    libpq-dev \
    libonig-dev \
    && docker-php-ext-install pdo pdo_pgsql mbstring \
    && rm -rf /var/lib/apt/lists/* 

RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN alias composer='/usr/local/bin/composer'

WORKDIR /var/www/html
RUN composer create-project --prefer-dist laravel/laravel meuendereco

RUN git clone https://github.com/LAwade/meuenderco.git

WORKDIR /var/www/html/meuendereco
RUN php artisan key:generate

EXPOSE 8181

ENTRYPOINT [ "php" ]

CMD [ "php", "artisan", "serve", "--host=0.0.0.0", "--port=8181" ]
