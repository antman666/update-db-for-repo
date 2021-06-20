#!/bin/bash

mkdir aya -p

urls=$(curl https://github.com/Brx86/repo/releases/tag/x86_64 -s|grep "/Brx86/repo/releases/download/x86_64/aya"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
db=$(echo $i|awk -F '/' '{print$7}')
echo Downloading $db
wget -q https://github.com/$i
repo-add aya.db.tar.gz ./*/*.pkg.tar.zst
done
