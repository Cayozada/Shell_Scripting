
#!/bin/bash

if [ ! -d logs ]
then
	mkdir logs
fi

process_log(){
local process=$(ps -eo pid --sort -size | head -n 11 | grep [0-9])
for pid in $process
do
	local process_name=$(ps -p $pid -o comm=)
	echo -n  $(date +%F,%H:%M:%S,) >> logs/$process_name.log
	local size_process=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$size_process/1024") MB" >> logs/$process_name.log
done
}

process_log

if [ $? -eq 0 ]
then
	echo "Log gerado com sucesso"
else
	echo "Falha no processo de geracao de log, contate o admin"
fi
