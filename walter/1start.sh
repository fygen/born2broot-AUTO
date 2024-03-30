function prompt_execute() {
    read -p "Do you want to execute: $1? (y/n): " answer 
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

user=$(who | cut -d ' ' -f1)

prompt_execute "apt install gpm -y"
prompt_execute "su -"
prompt_execute "apt-get update -y"
prompt_execute "apt-get upgrade -y"
prompt_execute "apt install sudo"
prompt_execute "usermod -aG sudo $(who | cut -d ' ' -f1)"
prompt_execute "getent group sudo"
prompt_execute "sudo visudo"
prompt_execute "sudo groupadd user42"
prompt_execute "usermod -aG user42 $(who | cut -d ' ' -f1)"
prompt_execute "getent group user42"
prompt_execute "cd /var/log"
prompt_execute "mkdir sudo"
prompt_execute "cd sudo"
prompt_execute "touch sudo.log"
prompt_execute "sudo visudo"
prompt_execute "echo '$user ALL=(ALL:ALL) ALL' >> /etc/sudoers"
prompt_execute "cat toSudoers.txt >> /etc/sudoers"

# Defaults    badpass_message="Password is wrong, please try again!"
# Defaults    passwd_tries=3
# Defaults    logfile="/var/log/sudo/sudo.log"
# Defaults    log_input, log_output
# Defaults    requiretty