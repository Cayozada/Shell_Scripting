
#!/bin/bash

convert_img(){
cd ~/Downloads/imagens-livros
if [ ! -d png ]
then
	mkdir png
fi

for img in *.jpg
do
	local img_no_ext=$(ls $img | awk -F. '{ print $1 }')
	convert $img_no_ext.jpg png/$img_no_ext.png
done
}

convert_img 2>error_log.txt 
if [ $? -eq 0 ]
then
	echo "Conversao Realizada com sucesso :)"
else
	echo "Falha na conversao"
fi




