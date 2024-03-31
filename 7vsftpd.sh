sudo apt-get install vsftpd
sudo sed -i 's/pam_service_name=vsftpd/pam_service_name=ftp/' /etc/vsftpd.conf
sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/' /etc/vsftpd.conf
sudo service vsftpd restart
sudo ufw allow ftp
sudo ufw status numbered
sudo nano /etc/vsftpd.conf
# USE BELOW COMMAND FOR SENDING FILES TO FTP SERVERS login is ayegen and password is Suriye4242
# curl -T <filetosend> ftp://<HOSTIP= hostname -I > --user $user:Suriye4242
