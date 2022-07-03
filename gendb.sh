#!/bin/bash

mkdir action -p

urls=$(curl https://github.com/antman/action-tool/releases/tag/x86_64 -s|grep "/antman/action-tool/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
  db=$(echo $i|awk -F '/' '{print$7}')
  echo Downloading $db
  wget -q https://github.com/$i -P action
done

repo-add -p action.db.tar.gz ./action/*.zst
