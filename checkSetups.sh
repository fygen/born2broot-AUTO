USER=$(users)
# read -p "Password: $1" PASS
# echo $PASS

sudo --version | grep -i sudo --color
git --version | grep -i git --color
wget --version | grep -i wget --color
vim --version | grep -i vim --color # If preferred during installation.
zsh --version | grep -i zsh --color
cat /etc/ssh/sshd_config | grep -i Port --color # Should be seen 4242 only
sudo service ssh status | grep -i enable -A 2 -B 2 --color  # Should have to work.
hostnamectl | grep hostname --color # If done correctly then username will be red if not result is empty
