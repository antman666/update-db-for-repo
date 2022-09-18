#!/bin/bash

mkdir kernels -p

urls=$(curl "https://api.github.com/repos/antman666/kernel-repo/releases/latest" -s | grep browser_download_url | awk '{print $2}')

for i in ${urls[*]}; do 
		pkg=$(echo $i|awk -F '/' '{print$9}')
		echo Downloading ${pkg%?}
		wget -q https://github.com/$i -P kernels/
done

repo-add -p kernels.db.tar.gz ./kernels/*.zst
