echo "justInstall no echo do your job"
./1system_setup_and_sudo_config.sh
echo "1system_setup_and_sudo_config.sh done"
./2install_required_packages.sh
echo "2install_required_packages.sh done"
./3configure_ssh_and_firewall.sh
echo "3configure_ssh_and_firewall.sh done"
./4password_policy_configuration.sh
echo "4password_policy_configuration.sh done"
./5setup_monitoring_and_reboot.sh
echo "5setup_monitoring_and_reboot.sh done"