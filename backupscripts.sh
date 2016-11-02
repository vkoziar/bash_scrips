#!/bin/sh

BACKUP_BASE="./backupscripts"
BACKUP_CONF="./backup.conf"
BACKUP_DIR="/home/admin/backup/web_full"
BACKUP_CMD="python /home/admin/backup_script/incrbackup.py"
BACKUP_SERVER=localhost
BACKUP_USER=admin
BACKUP_NS=ikeagroup
BACKUP_KEEP=3
TODAY=`date`

#$BACKUP_CMD --server $BACKUP_SERVER -c $BACKUP_CONF -t $BACKUP_DIR -u $BACKUP_USER -n $BACKUP_NS -k $BACKUP_KEEP
$BACKUP_CMD -c $BACKUP_CONF -t $BACKUP_DIR -u $BACKUP_USER -n $BACKUP_NS -k $BACKUP_KEEP
 
if [ $? -eq 0 ]; then
   echo "$TODAY Backup site success" >> /var/log/backup_site.log
else
   echo "$TODAY Backup site fail" >> /var/log/backup_site.log
fi

