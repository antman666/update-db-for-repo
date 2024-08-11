#!/bin/bash

mkdir cosmic -p

urls=$(curl "https://api.github.com/repos/antman666/cosmic-repo/releases/latest" -s | grep browser_download_url | awk '{print $2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i | awk -F '/' '{print$9}')
		echo Downloading ${pkg%?}
		wget -q ${i//\"/} -P cosmic/
done

repo-add -p cosmic.db.tar.gz ./cosmic/*.zst
