# Değişkenleri tanımla
architecture=$(hostnamectl | grep 'Operating System' | cut -d ' ' -f5- )
cpu_physical=$(grep -c processor /proc/cpuinfo)
vcpu=$(grep -c processor /proc/cpuinfo)
memory_usage=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }')
disk_usage=$(df -h | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}')
cpu_load=$(top -bn1 | awk '/%Cpu/{printf "%.2f", $(NF-2)}')
last_boot=$(who -b | awk '{print $3" "$4" "$5}')
lvm_use=$(lsblk | awk '/lvm/ {print $1; exit} END {print "no"}')
connection_tcp=$(netstat -an | awk '/ESTABLISHED/ {count++} END {print count}')
user_log=$(who | cut -d ' ' -f 1 | sort -u | wc -l)
network_ip=$(hostname -I)
network_mac=$(ip a | awk '/link\/ether/ {print $2}')
sudo_use=$(grep -c 'sudo ' /var/log/auth.log)

# String içinde değişkenleri kullanarak duvar mesajını oluştur
message="#Architecture: $architecture $(awk -F: '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//') $(arch)
#CPU physical: $cpu_physical
#vCPU: $vcpu
Memory Usage: $memory_usage
Disk Usage: $disk_usage
CPU Load: $cpu_load
#Last boot: $last_boot
#LVM use: $lvm_use
#Connection TCP: $connection_tcp
#User log: $user_log
Network: IP $network_ip ($network_mac)
#Sudo: $sudo_use"

# Duvar mesajını yayımla
sudo wall "$message"
