#!/bin/bash

mkdir own-repo -p

urls=$(curl "https://api.github.com/repos/antman666/own_repo/releases/latest" -s | grep browser_download_url | awk '{print $2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i | awk -F '/' '{print $9}')
		echo Downloading ${pkg%?}
		wget -q ${i//\"/} -P own-repo/
done

repo-add -p own-repo.db.tar.gz ./own-repo/*.zst
