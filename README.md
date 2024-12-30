# Türkçe Kurulum için --> [![tr](https://img.shields.io/badge/lang-tr-red.svg)](https://github.com/fygen/born2broot-AUTO/blob/master/README-TR.md)

# THERE IS A PERFECT AUTOMATION INCLUDING PRESEED VERSION AVAILABLE IN LINK BELOW
https://gitlab.com/murmurians/born2auto
https://medium.com/@yzeybek13/born2auto-automating-debian-server-setup-with-preseed-files-and-scripting-d2007a1d80ed

# AUTO-RIZE OTO-MATIZE Born2Broot Project: 
*  120 POINTS. If you can learn all this.
*  Setup in 5 minutes.
*  ALL SETUPS with WORDPRESS..
*  Only vftpd or a service is missing if you are interested go to CONTRIBUTE

## Overview
This project is part of the 42Cursus curriculum, specifically designed for the Born2Code program. Born2Broot is an introduction to system administration, where the goal is to set up a basic Linux system from scratch, configure it, create Wordpress and connect databases.

# Necessities
   * Virtual Machine.
   * Debian Setup done already.
   * ```apt install git```
   * OPEN PORTS from virtual machine setup: 80 (for Wordpress) 4242 (for SSH connection). 

#### Take the Snapshot of the Clean Setup. (You have installed Debian and ```apt install git```) LIKE RECOVERY I DID HERE.
   ![image](https://github.com/fygen/preseed/assets/25952641/69511f98-6acf-4385-a24e-70be3927f409)
   
#### This SNAPSHOT is important 
   * If there is any update or changes to Linux Filesystem
   * Or changes to Wordpress or any configuration file.
# * You can recover back to SNAPSHOT. If wrong installation.

## THEN

## Usage and Installation
To FINISH EASILY the Born2Broot project, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/fygen/born2broot-AUTO.git
   ```

2. Navigate to the project directory:
   ```bash
   cd preseed   # Enter folder
   chmod 777 *  # Give files system rights
   ```
   Then

3. Install and configure everything one by one using this Terminal prompts press "y" to all:
   ```bash
   ./executeLines.sh 1system_setup_and_sudo_config.sh
   ```
   one by one
   ```
   ./executeLines.sh 2install_required_packages.sh
   ./executeLines.sh 3configure_ssh_and_firewall.sh
   ./executeLines.sh 4password_policy_configuration.sh
   ./executeLines.sh 5setup_monitoring_and_reboot.sh
   ./executeLines.sh 6wordpress_lighttpd_mariaDB_php.sh
   ```
   
   And here you go. Including Wordpress setup all IS done. You only need to press "y" to all prompts of installer.
   If there is a problem just CTRL C to quit and retry what is the problem, or contact me, for some other solution.

## Contributing
Contributions are welcome! To contribute to the Born2Broot AUTOMATIZATION project, follow these steps:

1. ### The FTP server or a service which is 5 POINTS 

2. ### FULL AUTONOMOUS SETUP without pressing "y".

## HOW to Contribute 

1. Fork the repository.

2. Create a new branch: (which can be autonomous or SERVICE)
   ```bash
   git checkout -b autonomous/autonomous-using-loop
   ```

3. Make your changes and commit them:
   ```bash
   git commit -am "Add new feature"
   ```

4. Push to the branch:
   ```bash
   git push origin autonomous/autonomous-using-loop
   ```

5. Submit a pull request.

## License
This project is licensed under the MIT License.

## Contact
For any inquiries or support, please contact [fatihyegen.09@gmail.com](mailto:fatihyegen.09@gmail.com).
