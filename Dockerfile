FROM wordpress:6.9.0-php8.5-fpm-alpine AS wp

# install redis extension
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/download/2.9.7/install-php-extensions /usr/local/bin/
RUN install-php-extensions redis
RUN rm /usr/local/bin/install-php-extensions

# install wordpress cli
RUN curl -L -o wp-cli.phar https://github.com/wp-cli/wp-cli/releases/download/v2.12.0/wp-cli-2.12.0.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

USER www-data
