ARG DRUPAL_IMAGE=drupal:9-apache
FROM $DRUPAL_IMAGE

ENV DRUPAL_VERSION 9
ENV APACHE_LOG_DIR /var/log/apache2

COPY bootstrap.php .
COPY runtests.php .
COPY entrypoint.sh .
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
        git

RUN set -ex \
    && sudo -u www-data curl -L https://getcomposer.org/installer | php -d allow_url_fopen=on  -- --quiet --install-dir=/usr/bin --filename=composer \
	&& rm composer.lock \
	&& chown www-data:www-data . \
	&& chown -R www-data:www-data ./vendor ./web \
	&& sudo -u www-data composer install

EXPOSE 80
ENTRYPOINT ["./entrypoint.sh"]
