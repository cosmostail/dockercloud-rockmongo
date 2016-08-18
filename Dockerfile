FROM ubuntu:14.04
MAINTAINER Scott Wang <scott@wt83.com>

RUN locale-gen en_US.UTF-8
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2 libapache2-mod-php5 php5 php5-cli php5-common php5-curl php5-json php5-intl php5-mcrypt php5-mongo unzip
ADD https://codeload.github.com/iwind/rockmongo/zip/1.1.7 /tmp/rockmongo-1.1.7.zip

RUN rm -rf /var/www/html
RUN unzip /tmp/rockmongo-1.1.7.zip -d /var/www/
RUN mv /var/www/rockmongo-1.1.7 /var/www/html

RUN chown www-data:www-data -R /var/www/html
RUN chmod 777 /var/www/html/config.php
RUN a2enmod rewrite
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 30M/g' /etc/php5/apache2/php.ini

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /usr/bin/run-httpd.sh
ADD config.php /usr/bin/config.php

CMD ["/usr/bin/run-httpd.sh"]
