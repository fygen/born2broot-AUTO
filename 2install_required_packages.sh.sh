sudo apt install gpm -y
echo "$(gpm --version)"
sudo apt install openssh-server -y 
echo "$(ssh --version)"
sudo apt-get install ufw -y
echo "$(ufw --version)"
sudo apt-get install libpam-pwquality -y
echo "$(libpam-pwquality --version)"
sudo apt-get install git -y
echo "$(git --version)"
sudo apt-get install net-tools -y
echo "$(netstat --version)"