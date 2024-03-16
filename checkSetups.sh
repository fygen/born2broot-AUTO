git --version
wget --version
vim --version # If preferred during installation.
zsh --version 
cat /etc/ssh/sshd_config | grep Port # Should be 4242 only
sudo service ssh status # Should have to work.
hostname | grep $(users) --color # If done correctly then username will be red if not result is empty
