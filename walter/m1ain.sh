#ENSURE YOU ARE: su -
user=$(who | cut -d ' ' -f1)
echo $user
apt install gpm -y
apt-get update -y
apt-get upgrade -y
apt install sudo
usermod -aG sudo $(who | cut -d ' ' -f1)
getent group sudo
sudo groupadd user42
usermod -aG user42 $(who | cut -d ' ' -f1)
getent group user42
cd /var/log
mkdir sudo
cd sudo
touch sudo.log
echo '$user ALL=(ALL:ALL) ALL' >> /etc/sudoers
cat toSudoers.txt >> /etc/sudoers
sudo visudo