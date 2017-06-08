#!/bin/bash

mkdir -p /var/www/html/typo3conf/ext/
chown -R www-data /var/www/html/typo3conf/ext/
ln -s /tmp/dfg-viewer/dfgviewer /var/www/html/typo3conf/ext/
ln -s /tmp/kitodo-presentation/dlf /var/www/html/typo3conf/ext/
ln -s /tmp/t3jquery /var/www/html/typo3conf/ext/
ln -s /tmp/static_info_tables /var/www/html/typo3conf/ext/
ln -s /tmp/devlog /var/www/html/typo3conf/ext/
touch /var/www/html/FIRST_INSTALL
cp /tmp/LocalConfiguration.php /var/www/html/typo3conf/
cp /tmp/template.tmpl /var/www/html/typo3conf/ext/dfgviewer/res
touch /var/www/html/typo3conf/ENABLE_INSTALL_TOOL
chown -R www-data /var/www/html/typo3conf/
service apache2 start && tail -f /dev/null