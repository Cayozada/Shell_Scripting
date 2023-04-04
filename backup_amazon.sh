
#!/bin/bash

PATH_BACKUP=/home/chains/backup-gatos-molhados-amazon
cd $PATH_BACKUP
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tables=$(mysql -u root gatosmolhados -e "show tables;" | grep -v Table)

for table in $tables
do
	mysqldump -u root gatosmolhados $table > $PATH_BACKUP/$data/$table.sql
done

aws s3 sync $PATH_BACKUP s3://shell-script

