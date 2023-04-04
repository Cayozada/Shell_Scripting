
#!/bin/bash

convert_img(){
	local path_img=$1
	local img_no_ext=$(ls $path_img | awk -F. {'print $1'})
	convert $img_no_ext.jpg $img_no_ext.png 
}

sweep_dir(){
cd $1
for file in *
do
	local path_file=$(find ~/Downloads/imagens-novos-livros -name $file)
	if [ -d $path_file ]
	then
		sweep_dir $path_file
	else
		convert_img $path_file
	fi
done
}

sweep_dir ~/Downloads/imagens-novos-livros 
if [ $? -eq 0 ]
then
	echo "conversao realizada com sucesso :)"
else
	echo "Houve uma falha na conversao, verifique o log de erros"
fi
