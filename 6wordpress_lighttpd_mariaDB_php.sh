sudo apt install lighttpd
sudo apt install php
sudo apt install php-cgi
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload
sudo apt install mariadb-server
sudo mysql_secure_installation
# In mysql enter the following commands;
# CREATE DATABASE wordpress_db;
# GRANT ALL ON wordpress_db.* TO 'wp_user'@'localhost' IDENTIFIED BY 'password';
sudo mysql -u root -p
sudo apt install php-mysql
cd /tmp && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cp -R wordpress /var/www/html/
chown -R www-data:www-data /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress/
# vsftp FTP server for service
sudo apt install vsftpd