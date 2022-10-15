#!/bin/bash

mkdir action-repo -p

urls=$(curl "https://api.github.com/repos/antman666/action-repo/releases/latest" -s | grep browser_download_url | awk '{print $2}')

for i in ${urls[*]}; do 
  db=$(echo $i|awk -F '/' '{print$9}')
  echo Downloading $db
  wget -q https://github.com/$i -P action-repo
done

repo-add -p action-repo.db.tar.gz ./action-repo/*.zst
