sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --skip-chsh
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/' /home/$player/.zshrc