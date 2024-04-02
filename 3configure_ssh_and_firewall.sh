sudo systemctl status ssh
# Find this line #Port22 to Port 4242 && sudo grep Port /etc/ssh/sshd_config
sudo service ssh stop
sudo sed -i 's/#Port 22/Port 4242/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo service ssh start
echo "starting service ssh" 
sudo nano /etc/ssh/sshd_config
sudo service ssh restart
sudo ufw enable
sudo ufw status numbered
sudo ufw allow ssh
sudo ufw delete $(sudo ufw status numbered | awk '/22/{print $2}' | cut -d] -f 1)  
sudo ufw delete $(sudo ufw status numbered | awk '/22/{print $2}' | cut -d] -f 1) 
sudo ufw status numbered
sudo ufw allow 4242
sudo ufw status numbered
# Change the Host Port and Guest Port to 4242 in Oracle VM
sudo systemctl restart ssh
# Restart the VM
# In Ubuntu terminal
# ssh ayegen@127.0.0.1 -p 4242
# If get any error in the connection
rm ~/.ssh/known_hosts
# change the Network config to attached to bridge adaptor - eno2