#!/bin/bash

mkdir own-repo -p

urls=$(curl https://github.com/antman666/own_repo/releases/tag/x86_64 -s|grep "/antman666/own_repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i|awk -F '/' '{print$7}')
		echo Downloading $pkg
		wget -q https://github.com/$i -P own-repo/
		repo-add -p own-repo.db.tar.gz ./own-repo/$pkg
done

