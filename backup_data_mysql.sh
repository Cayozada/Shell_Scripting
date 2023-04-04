
#!/bin/bash

HOME_PATH=/home/chains

cd $HOME_PATH

if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -u root $1 > $HOME_PATH/backup/$1.sql

if [ $? -eq 0 ]
then
	echo "Backup realizado com sucesso"
else
	echo "ocorreu uma falha no processo de criacao do backup"
fi
