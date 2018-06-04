#!/bin/bash


#########################################FUNCTIONS

function safe_create_dir(){

	if [ -d $1 ]; then
   		echo "$1 exists."
   	
	else
		mkdir $1
   		echo "dir $1 created."
	fi


}

function dwld_src(){

	wget  https://github.com/$1/archive/master.zip
	unzip master.zip
	rm master.zip

}


# curl -s https://api.github.com/repos/openresty/headers-more-nginx-module/releases
function getGitLastVersion(){
	echo $1
	latest=$(curl -s https://api.github.com/repos/$1/releases | jq -r .[].tag_name | grep -v rc | head -1)
	echo ${latest}
}



#==================================================


safe_create_dir ./extra-modules
cd ./extra-modules

echo "DOWNLOAD EXTRA MODULES"

dwld_src openresty/headers-more-nginx-module

echo $(getGitLastVersion "openresty/headers-more-nginx-module")















