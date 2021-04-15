ARG DRUPAL_IMAGE=drupal:7-apache
FROM $DRUPAL_IMAGE

ENV DRUPAL_VERSION 7

COPY composer.json .
COPY php-overrides.ini /usr/local/etc/php/conf.d

RUN chown -R www-data:www-data /var/www \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && mkdir /results

RUN set -ex \
    && apt-get update \
    && apt-get install -y \
        sudo \
        apt-utils \
        unzip \
        git \
        sqlite3

RUN set -ex \
    && curl -L -o /usr/bin/drush https://github.com/drush-ops/drush/releases/download/8.1.18/drush.phar \
    && chmod +x /usr/bin/drush

RUN set -ex \
    && sudo -u www-data curl -L https://getcomposer.org/installer | php -d allow_url_fopen=on  -- --quiet --install-dir=/usr/local/bin --filename=composer \
    && sudo -u www-data composer install

EXPOSE 80
CMD ["apache2-foreground"]
