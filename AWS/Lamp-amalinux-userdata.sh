#!/bin/bash

sudo yum update -y && \\
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2 && \\
sudo yum install -y httpd mariadb-server php-mbstring php-xml && \\
sudo sudo usermod -aG apache ec2-user && sudo chown -R ec2-user:apache /var/www && \\
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \; && \\
find /var/www -type f -exec sudo chmod 0664 {} \; && \\
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php && \\
cd /var/www/html && wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \\
mkdir phpMyAdmin && tar -xvzf phpMyAdmin-latest-all-languages.tar.gz -C phpMyAdmin --strip-components 1 && \\
rm phpMyAdmin-latest-all-languages.tar.gz
sleep 3
sudo systemctl restart mariadb httpd php-fpm && 


