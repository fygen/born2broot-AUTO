sudo nano /etc/pam.d/common-password
password  requisite     pam_pwquality.so  retry=3 minlen=10 ucredit=-1 lcredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
sudo nano /etc/login.defs
PASS_MAX_DAYS 30 > PASS_MIN_DAYS 2 > PASS_WARN_AGE 7
sudo chage --maxdays 30 --mindays 2 --warndays 7 your_username
sudo reboot
chage -l your_username