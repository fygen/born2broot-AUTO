#!/bin/bash
wd=$(pwd)
autoInstall=$1
if [ "$autoInstall" == "y" ]; then
    echo "Auto install"
else
    echo "Manual install"
fi

function echo_execute() {
    if [ "$autoInstall" == "y" ]; then
        answer = "y"
    else
        read answer # Automatically accept 'yes'
    fi
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

$user=$(who | cut -d ' ' -f1)

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


enter_file "./1system_setup_and_sudo_config.sh"
echo "1system_setup_and_sudo_config.sh done"
cd $wd
enter_file "./2install_required_packages.sh"
echo "2install_required_packages.sh done"
cd $wd 
enter_file "./3configure_ssh_and_firewall.sh"
echo "3configure_ssh_and_firewall.sh done"
cd $wd
enter_file "./4password_policy_configuration.sh"
echo "4password_policy_configuration.sh done"
cd $wd
enter_file "./5setup_monitoring_and_reboot.sh"
echo "5setup_monitoring_and_reboot.sh done"