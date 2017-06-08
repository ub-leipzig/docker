FROM php:7.0-apache
MAINTAINER Christopher Johnson <chjohnson39@gmail.com>
LABEL description = "Kitodo Presentation"

# add source for newer CURL version that has many bugfixes required for some operations
ADD apt-source-costamagnagianfranco_ettercap-stable-backports /etc/apt/sources.list.d/costamagnagianfranco-ettercap-stable-backports-trusty.list

# Install packages
RUN apt-get update \
&& apt-get -yq --force-yes install mysql-client git curl imagemagick vim unzip wget libxml2-dev libmagickwand-dev libmagickcore-dev libjpeg-dev libpng-dev libfreetype6-dev \
&& docker-php-ext-install xml gd soap zip mysqli \
&& pecl install imagick \
&& rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite
ADD typo3.conf /etc/apache2/sites-enabled/000-default.conf

# Adjust some php settings
ADD typo3.php.ini /usr/local/etc/php/

# Install dependencies defined in composer.json
RUN rm -fr /app && mkdir /app
VOLUME ["/app/typo3temp", "/app/uploads", "/app/fileadmin"]

ADD AdditionalConfiguration.php /app/typo3conf/
ADD composer.json /app/
WORKDIR /app
RUN composer install && cp typo3conf/ext/typo3_console/Scripts/typo3cms /app

# Add script to create 'typo3' DB
ADD run.sh /run.sh
ADD run-typo3.sh /run-typo3.sh
RUN chmod 755 /*.sh

# Expose environment variables
ENV DB_HOST db
ENV DB_PORT 3306
ENV DB_NAME typo3
ENV DB_USER admin
ENV DB_PASS password
ENV INSTALL_TOOL_PASSWORD password

# Enable composer autoloader in TYPO3
ENV TYPO3_COMPOSER_AUTOLOAD 1

WORKDIR /app/typo3conf/ext/dlf
RUN git clone https://github.com/kitodo/kitodo-presentation.git ./

WORKDIR /app/typo3conf/ext/t3jquery_3.0.4
RUN wget -O t3jquery.zip https://typo3.org/extensions/repository/download/t3jquery/3.0.4/zip/
RUN unzip t3jquery.zip

RUN touch /app/FIRST_INSTALL
RUN cp -R /app/* /var/www/html/
WORKDIR /var/www/html

EXPOSE 80
CMD ["/bin/bash", "-c", "/run-typo3.sh"]