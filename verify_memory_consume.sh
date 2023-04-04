
#!/bin/bash

total_memory=$(free | grep -i mem | awk '{ print $2}')
memory_used=$(free | grep -i mem | awk '{ print $3}')
relation_current_total_memory=$(bc <<< "scale=2;$memory_used/$total_memory *100" | awk -F. '{ print $1 }')

if [ $relation_current_total_memory -gt 50 ]
then
mail -s "Consumo de memoria acima do esperado" caiopereira1714@gmail.com<<mess
O consumo de memoria esta acima do esperado. o consumo atual e de $(free -h | grep -i mem | awk '{ print $3 }')
O consumo de limite esperado e 50%.
mess

fi
