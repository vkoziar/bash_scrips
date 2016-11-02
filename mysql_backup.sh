#!/bin/sh
TODAY=`date`

python /home/admin/backup_script/mysqlbackup.py -d admin_default,admin_ik,admin_ikea,admin_traddb,admin_trading,roundcube -u root -p XXXXXX -s localhost -t /home/admin/backup/db_backup/ -k 3

if [ $? -eq 0 ]; then
   echo "$TODAY Backup db success" >> /var/log/backup_db.log
else
   echo "$TODAY Backup db fail" >> /var/log/backup_db.log
fi

