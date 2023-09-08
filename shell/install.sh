#! /bin/sh
# auto magicly setup bashrc and profile 

bashrc_p="\n# .custom_bashrc is your setup file and you should change it over .bashrc\nsource $HOME/.custom_bashrc\n"
if [ -f "$HOME/.bashrc" ]; then
	echo  "copping .custom_bashrc"
	cp .custom_bashrc $HOME
	echo "adding to custom_bashrc to your bashrc"
	echo "$bashrc_p" >> $HOME/.bashrc
fi 

bash_aliases_p="\n# .custom_bashrc_aliases is your setup file and you should change it over .bashrc_aliases\nsource $HOME/.custom_bash_aliases\n"
if [ -f "$HOME/.bash_aliases" ]; then
	echo  "copping .custom_bash_aliases"
	cp .custom_bash_aliases $HOME
	echo "adding to custom_bash_aliases to your bash_aliases"
	echo "$bash_aliases_p" >> $HOME/.bash_aliases
fi 

profile_p="\n# .custom_profile is your setup file and you should change it over .profile\nsource $HOME/.custom_profile\n"
if [ -f "$HOME/.profile" ]; then
	echo  "copping .custom_profile"
	cp .custom_profile $HOME
	echo "adding custom_profile to your bashrc"
	echo "$profile_p" >> $HOME/.profile
fi 

