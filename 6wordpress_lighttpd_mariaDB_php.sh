workdir=$(pwd)
downdir="/var/www/html/"
sudo apt install lighttpd
sudo apt install php
sudo apt install php-cgi
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload
sudo apt install mariadb-server
sudo ufw allow 80
sudo mysql_secure_installation
# In mysql enter the following commands;
# CREATE DATABASE wordpress;
# GRANT ALL ON wordpress.* TO 'wp_user'@'localhost' IDENTIFIED BY 'password';
sudo mysql -u root -p
sudo apt install php-mysql
cd $downdir && wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo cp -R $downdir/wordpress /var/www/html/
sudo cp $workdir/wp-config.php /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
# vsftp FTP server for service
# sudo apt install vsftpd