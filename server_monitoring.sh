
#!/bin/bash

response_http=$(curl --write-out %{http_code} --silent  --output /dev/null  http://localhost)
if [ $response_http -ne 200 ]
then
mail -s "problema no servidor" caiopereira1714@gmail.com<<mess
Houve um problema no servidor e portanto ele ja foi reiniciado. 
o problema fez com que os usuarios perdessem acesso ao servidor web, por favor relate e arrume a origem, atenciosamente seu chefe.
mess
	sudo service apache2 start
fi
