#!/bin/bash
admin1="xxxx1@lvivsoft.com"
admin2="xxxx2@lvivsoft.com"

# checking /dev/sda /home
usage_percent=`df -h /dev/sda | grep /dev/sda | awk -F" " '{ print $5 }'| sed 's/%/ /'`

echo $usage_percent

if [ $usage_percent -gt 85 ]; then
   echo "$TODAY disk is full used: $usage_percent%" >> /var/log/df.log
   echo "ikeagroup $TODAY disk /dev/sda /home is full. Used: $usage_percent%" | mail -s "check disk on ikea site" $admin1
   echo "ikeagroup $TODAY disk /dev/sda /home is full. Used: $usage_percent%" | mail -s "check disk on ikea site" $admin2
   echo "percent > 85"
else
   echo "$TODAY " >> /var/log/df.log
   echo "percent < 85"
fi

# checking /dev/vda1 /
usage_percent=`df -h /dev/vda1 | grep /dev/vda | awk -F" " '{ print $5 }'| sed 's/%/ /'`

if [ $usage_percent -gt 85 ]; then
   echo "$TODAY disk is full used: $usage_percent%" >> /var/log/df.log
   echo "ikeagroup $TODAY disk /dev/vda1 / is full. Used: $usage_percent%" | mail -s "check disk on ikea site" $admin1
   echo "ikeagroup $TODAY disk /dev/vda1 / is full. Used: $usage_percent%" | mail -s "check disk on ikea site" $admin2
   echo "percent > 85"
else
   echo "$TODAY " >> /var/log/df.log
   echo "percent < 85"
fi

