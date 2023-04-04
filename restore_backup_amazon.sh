
#!/bin/bash

PATH_RESTORE=/home/chains/restore-gatos-molhados-amazon

aws s3 sync s3://shell-script/$(date +%F) $PATH_RESTORE

cd $PATH_RESTORE 
if [ -f $1.sql ]
then
	mysql -u root gatosmolhados < $1.sql
	if [ $? -eq 0 ]
	then
		echo "O banco foi restaurado com sucesso"
	else
		echo "Houve uma falha ao restaura o banco de dados"
	fi
else
	echo "O arquivo indicado nao existe"
fi

