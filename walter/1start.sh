function prompt_execute() {
    read -p "Do you want to execute: $1? (y/n): " answer 
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

prompt_execute "su -"
prompt_execute "apt-get update -y"
prompt_execute "apt-get upgrade -y"
prompt_execute "apt install sudo"
prompt_execute "usermod -aG sudo $(who | cut -d ' ' -f1)"
prompt_execute "getent group sudo"
prompt_execute "sudo visudo"
prompt_execute "echo 'Find User privilege specification then type: your_username   ALL=(ALL) ALL'"
prompt_execute "sudo groupadd user42"
prompt_execute "usermod -aG user42 $(who | cut -d ' ' -f1)"
prompt_execute "getent group user42"
prompt_execute "cd /var/log"
prompt_execute "mkdir sudo"
prompt_execute "cd sudo"
prompt_execute "touch sudo.log"
prompt_execute "sudo visudo"
prompt_execute "Defaults    badpass_message="Password is wrong, please try again!""
prompt_execute "Defaults    passwd_tries=3"
prompt_execute "Defaults    logfile="/var/log/sudo/sudo.log""
prompt_execute "Defaults    log_input, log_output"
prompt_execute "Defaults    requiretty"