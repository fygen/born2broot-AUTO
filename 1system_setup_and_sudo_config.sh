#ENSURE YOU ARE: su -
user=$(who | cut -d ' ' -f1 | awk 'NR==1' )
echo $user
apt install gpm -y
gpm -version
apt-get update -y
apt-get upgrade -y
apt install sudo
sudo --version | grep version --color
sudo usermod -aG sudo $user
getent group sudo
sudo groupadd user42
sudo usermod -aG user42 $user
getent group user42
mkdir -p /var/log/sudo
touch /var/log/sudo/sudo.log
echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
pwd && ls -l | grep toS
cat toSudoers.txt >> /etc/sudoers
sudo visudo