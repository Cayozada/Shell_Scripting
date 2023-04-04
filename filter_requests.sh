
#!/bin/bash

cd ~/apache-log

if [ -z $1 ]
then
	while [ -z $request ]
	do
		read -p "Voce esqueceu de colocar o parametro(get,put,post,delete), Pode colocar agora: " request
		upper_letter=$(echo $request | awk '{ print toupper($1) }')
	done
else
	upper_letter=$(echo $1 | awk '{ print toupper($1) }')
fi

case $upper_letter in
	GET)
	cat apache.log | grep GET
	;;
	POST)
	cat apache.log | grep POST
	;;
	PUT)
	cat apache.log | grep PUT
	;;
	DELETE)
	cat apache.log | grep DELETE
	;;
	*)
	echo "passagem de parametro invalida"
	;;
esac


