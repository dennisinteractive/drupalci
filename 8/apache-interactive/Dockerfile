ARG DRUPAL_IMAGE=drupal:8-apache
FROM $DRUPAL_IMAGE

LABEL com.circleci.preserve-entrypoint=true

ENV DRUPAL_VERSION 8
ENV APACHE_LOG_DIR /var/log/messages

COPY php-overrides.ini /usr/local/etc/php/conf.d

RUN chown -R www-data:www-data /var/www \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && mkdir /results \
    && mkdir /var/log/messages

RUN set -ex \
    && apt-get update \
    && apt-get install -y \
        sudo \
        apt-utils \
        unzip \
        git \
        sqlite3

RUN set -ex \
    && curl -L -o /usr/bin/drush https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar \
    && chmod +x /usr/bin/drush \
    && sudo curl -L -o /usr/local/bin/drupal https://drupalconsole.com/installer \
    && sudo chmod +x /usr/local/bin/drupal

RUN set -ex \
    && sudo -u www-data curl -L https://getcomposer.org/installer | php -d allow_url_fopen=on  -- --quiet --install-dir=/usr/bin --filename=composer \
	&& rm composer.lock \
	&& chown www-data:www-data . \
	&& chown -R www-data:www-data ./vendor ./web \
	&& sudo -u www-data composer install

EXPOSE 80
CMD ["apache2-foreground"]
