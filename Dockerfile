# Apache Variant - MyGES .ics exporter
FROM httpd:bullseye

# Update and upgrade Bullseye package
RUN apt update -y
RUN apt upgrade -y

# Install mandatory packages
RUN apt-get install git -y
RUN apt-get install composer -y

# Install PHP and associated packages
RUN apt-get install php libapache2-mod-php php-mysql -y

# Clone Github software repo and navigate to directory
RUN git clone https://github.com/kidelag/agenda-ges
RUN cd agenda-ges

# Add endvar for MyGES auth file
RUN cd agenda-ges && rm config.php
RUN cd agenda-ges && echo "<?php define(getenv('NICKNAME'), array('MYGES_USERNAME' => getenv('MYGES_USERNAME'), 'MYGES_PASSWORD' => getenv('MYGES_PASSWORD')));" >> config.php
RUN cd agenda-ges && cat config.php && sleep 10s

# Allow Composer to run as a super user for next step
RUN export COMPOSER_ALLOW_SUPERUSER=1;

# Install software dependencies
RUN composer install --working-dir=./agenda-ges

# Delete all default pages
RUN rm -rf /var/www/html/index.html

# Move the whole software to Apache default webpage location
RUN cd agenda-ges
RUN mv * /var/www/html

# Apache Exposure startup rules
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]