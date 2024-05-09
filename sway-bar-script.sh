time=$(date +"%a, %b %d, %Y %r")
battery_capacity$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

echo $battery_status $battery_capacity $time