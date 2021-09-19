#!/bin/bash

mkdir kernels -p

urls=$(curl https://github.com/antman666/kernel-repo/releases/tag/x86_64 -s|grep "/antman666/kernel-repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i|awk -F '/' '{print$7}')
		echo Downloading $pkg
		wget -q https://github.com/$i -P kernels/
		repo-add -p kernels.db.tar.gz ./kernels/$pkg
done

