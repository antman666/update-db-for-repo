#!/bin/bash

mkdir own-kernels -p

urls=$(curl https://github.com/antman666/own_kernel/releases/tag/x86_64 -s|grep "/antman666/own_kernel/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i|awk -F '/' '{print$7}')
		echo Downloading $pkg
		wget -q https://github.com/$i -P own-kernels/
		repo-add -p own-kernels.db.tar.gz ./own-kernels/$pkg
done

