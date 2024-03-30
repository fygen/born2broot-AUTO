sudo ss -tunlp #check the open doors
ip a #your current address
sudo nano /etc/network/interfaces
change line allow-hotplug enp0s3 to
auto enp0s3
change line iface enp0s3 inet dhcp to
iface enp0s3 inet static
Then add the follow lines
address your_current_ip
netmask 255.255.0.0
gateway 10.11.254.254
dns-nameservers 10.11.254.254
sudo systemctl restart networking
sudo systemctl status networking
sudo reboot
ss -tulnp