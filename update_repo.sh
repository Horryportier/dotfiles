#! /bin/bash

msg="$(date)"

repos=()
repos[0]="/home/$(whoami)/Documents/CheatSheet"
repos[1]="/home/$(whoami)/Documents/dotfiles"


pull(){
        echo -e "$(git pull)"
}

push(){
        echo -e "$(git add .)"
        echo -e "$(git commit -m "$msg")"
        echo -e "$(git push origin main)"
}

for i in "${repos[@]}"; do
        echo -e "\033[1;32m$i\033[0m"
        cd "$i"
        pull
        push
done
