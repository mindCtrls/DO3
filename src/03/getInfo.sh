hostname=$(cat /etc/hostname)

timezone=$(cat /etc/timezone)
timezone_part=$(date +%Z | sed 's/+0/+/; s/-0/-/')
timezone="$timezone UTC $timezone_part" 

user=$(whoami)
os=$(source /etc/os-release; echo "$NAME $VERSION")
date=$(date +"%d %B %Y %T")
uptime=$(uptime | cut -d "," -f 1)
uptimeInSecond=$(cat /proc/uptime | cut -d " " -f 1)
ip=$(hostname)
mask=$(ifconfig | grep -w "inet" | awk -F" " '{print $4}' | head -n1)
gateway=$(route -n | grep -w "^0.0.0.0" | awk '{print $2}')

ram_total=$(free -b | grep -w 'Mem:' | awk '{printf "%.3f", $2/1024/1024/1024}')
ram_used=$(free -b | grep -w 'Mem:' | awk '{printf "%.3f", $3/1024/1024/1024}')
ram_free=$(free -b | grep -w 'Mem:' | awk '{printf "%.3f", $2/1024/1024/1024}')

ram_total="$ram_total GB"
ram_used="$ram_used GB"
ram_free="$ram_free GB"

space_root=$(df --output=source,size | tail -1 | awk '{printf "%.3f", $2/1024/1024}')
space_root_used=$(df --output=source,used | tail -1 | awk '{printf "%.3f", $2/1024/1024}')
space_root_free=$(df --output=source,avail | tail -1 | awk '{printf "%.3f", $2/1024/1024}')

space_root="$space_root MB"
space_root_used="$space_root_used MB"
space_root_free="$space_root_free MB"

system_info=$(cat <<EOF
HOSTNAME = $hostname
TIMEZONE = $timezone
USER = $user
OS = $os
DATE = $date
UPTIME = $uptime
UPTIME_SEC = $uptimeInSecond
IP = $ip
MASK = $mask
GATEWAY = $gateway
RAM_TOTAL = $ram_total
RAM_USED = $ram_used
RAM_FREE = $ram_free
SPACE_ROOT = $space_root
SPACE_ROOT_USED =  $space_root_used
SPACE_ROOT_FREE = $space_root_free
EOF
)

