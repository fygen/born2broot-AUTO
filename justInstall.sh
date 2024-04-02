#!/bin/bash
wd=$(pwd)
autoInstall=$1
if [ "$autoInstall" == "y" ]; then
    echo "Auto install"
    answer="y"
else
    echo "Manual install"
fi

function echo_execute() {
    if [ "$answer" == "${answer#[Yy]}" ]; then
        eval "$1"
    else
        read 
        eval "$1"
    fi
}

user=$(who | cut -d ' ' -f1 | awk 'NR==1' )

# Source the functions file
# source funcs.sh
function enter_file(){
    # while IFS= read -r line; do
    #     echo_execute "$line"
    # done < "$1"
    while IFS= read -r line; do
        echo_execute "$line"
    done < "$1"
}

read -p "1system_setup_and_sudo_config.sh"
enter_file "./1system_setup_and_sudo_config.sh"
cd $wd
read -p "2install_required_packages.sh"
enter_file "./2install_required_packages.sh"
cd $wd 
read -p "3configure_ssh_and_firewall.sh"
enter_file "./3configure_ssh_and_firewall.sh"
cd $wd
read -p "4password_policy_configuration.sh"
enter_file "./4password_policy_configuration.sh"
cd $wd
read -p "5setup_monitoring_and_reboot.sh"
enter_file "./5setup_monitoring_and_reboot.sh"