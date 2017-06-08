FROM martinhelmich/typo3:7.6

MAINTAINER Christopher Johnson <chjohnson39@gmail.com>
LABEL description = "Kitodo Presentation"

RUN apt-get update && \
apt-get -yq --force-yes install wget unzip git nano

WORKDIR /tmp
RUN git clone https://github.com/kitodo/kitodo-presentation.git \
&& git clone https://github.com/slub/dfg-viewer.git \
&& git clone https://github.com/typo3-themes/t3jquery.git \
&& git clone https://github.com/TYPO3-extensions/static_info_tables.git \
&& git clone https://github.com/fsuter/devlog.git

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY LocalConfiguration.php /tmp
COPY tmpl/dfgviewer/template.tmpl /tmp
COPY entrypoint.sh /entrypoint.sh

RUN chmod 700 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]