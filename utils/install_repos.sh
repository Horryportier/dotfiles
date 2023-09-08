#! /bin/bash
# this tool will get all your repos and install them 
# params					   (when passed it will try to install with ssh link othervise will use htpp)
# ./install_repos.sh [username] [destination path] [--ssh]
#			      (full path prefered) 
app_exists() {
	command -v $1 &> /dev/null
}

username=$1
install_path=$2
url_type=$3

if [ "$url_type" = "--ssh" ]; then 
	url="git@github.com:$username"
else 
	url="https://github.com/$username"
fi

if  app_exsts git; then
	echo -e "\e[31mGIT NOT IN PATH!\e[0m"
	exit 1
fi

repos=($(curl https://api.github.com/users/$username/repos | jq -r '.[].url'))

for t in ${repos[@]}; do
	name=$(basename $t)
	if [ ! -d "$install_path/$name" ]; then
		echo -e "\e[31mINSTALLING REPO: \e[32m" $name "\e[0m"
		git clone "$url/$name.git" "$install_path/$name"
		echo -e "\e[31mFINISHED INSTALING: \e[32m" $name "\e[0m"
	else 
		echo -e "\e[31mAREALDY INSTALED\e[32m" $name "\e[0m"
	fi
done
