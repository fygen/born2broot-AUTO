#!/bin/bash

function echo_execute() {
    echo "Executing commands from file: $1"
    eval "$1"
}

$user=$(who | cut -d ' ' -f1)

# Source the functions file
# source funcs.sh
function enter_file(){
    # Read each line from the file using a for loop
    IFS=$'\n'  # Set IFS to newline
    for line in $(<"$1"); do
        echo_execute "$line"
    done
}


enter_file "./1system_setup_and_sudo_config.sh" &
pid1=$!
wait $pid1
echo "1system_setup_and_sudo_config.sh done"
enter_file "./2install_required_packages.sh" &
pid2=$!
wait $pid2
echo "2install_required_packages.sh done" 
enter_file "./3configure_ssh_and_firewall.sh" &
pid3=$!
wait $pid3
echo "3configure_ssh_and_firewall.sh done"
enter_file "./4password_policy_configuration.sh" &
pid4=$!
wait $pid4
echo "4password_policy_configuration.sh done"
enter_file "./5setup_monitoring_and_reboot.sh" &
pid5=$!
wait $pid5
echo "5setup_monitoring_and_reboot.sh done"