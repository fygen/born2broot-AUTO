su -
apt update –y
apt upgrade -y
apt install sudo
dpkg -l | grep sudo
adduser duzun sudo
getent group sudo
echo "\nduzun ALL=(ALL:ALL) ALL" >> /etc/sudoers
apt install git –y
git --version
apt install wget
apt install zsh -y
zsh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
nano ~/.zshrc
#ZSH_THEME=”robbyrussell” tema ismini ZSH_THEME=”bira”
apt install ssh –y
dpkg -l | grep ssh
systemctl status ssh
service ssh restart
echo "\nPort 4242" >> /etc/ssh/sshd_config
echo "\nPermitRootLogin no" >> /etc/ssh/sshd_config
systemctl status ssh
grep Port /etc/ssh/sshd_config
service ssh restart
apt install ufw -y
dpkg -l | grep ufw
ufw enable
systemctl status uwf
ufw allow ssh
ufw allow 4242
ufw status numbered