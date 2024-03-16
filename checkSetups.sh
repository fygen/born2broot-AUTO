git --version | grep git --color
wget --version | grep wget --color
vim --version | grep vim --color # If preferred during installation.
zsh --version | grep zsh --color
cat /etc/ssh/sshd_config | grep Port --color # Should be seen 4242 only
sudo service ssh status | grep enable -A 2 -B 2 --color  # Should have to work.
hostname | grep $(users) --color # If done correctly then username will be red if not result is empty
