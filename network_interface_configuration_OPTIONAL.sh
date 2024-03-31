sudo ss -tunlp #check the open doors
ip a #your current address

# change line: allow-hotplug enp0s3 -> auto enp0s3
sudo sed -i 's/allow-hotplug enp0s3/auto enp0s3/' /etc/network/interfaces

# change line: iface enp0s3 inet dhcp -> iface enp0s3 inet static
sudo sed -i 's/iface enp0s3 inet dhcp/iface enp0s3 inet static/' /etc/network/interfaces

# Then add the follow lines
echo "address $(ip a | grep inet | awk '{print $2}' | grep 10 | cut -d/ -f1)" >> /etc/network/interfaces 
cat toInterfaces.txt >> /etc/network/interfaces

ip a # COPY THE IP ADDRESS WITH RIGHT CLICK MOUSE THEN PASTE IT IN THE NEXT COMMAND 
sudo nano /etc/network/interfaces
sudo systemctl restart networking
sudo systemctl status networking
sudo reboot
ss -tulnp