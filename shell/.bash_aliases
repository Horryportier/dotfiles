alias vim="nvim"
alias gvim="nvim --listen godothost ."
alias acargo="cargo generate --git https://github.com/Rahix/avr-hal-template.git"
alias kan="rust-kanban"
#alias rm="move"
#alias remove="rm"
#alias mpv="mpv --input-ipc-server=/tmp/mpvsocket"

alias ls="exa"


alias icat="kitty +kitten icat"

alias nconfig="vim $(echo $HOME)/.config/nvim"

alias ts="tmux-sessionizer"
alias tl="tmux ls"
alias tk="tmux kill-ses -a"
alias ta="tmux at"

alias horry="Watcher eune HorryPortier6 -s -r"

# esp tools
alias get_esprs='. $HOME/export-esp.sh'

# # godot 
# alias godot='godot &'

alias nnn='nnn -e'
alias n='nnn'

alias remote="git remote show -n origin | head -n 2 | tail -n 1 | sed -n -e 's/^.*URL: //p' | cut -d '@' -f 2 | tr : / | sed  's/^/https\:\/\//'"
alias fpd="echo file://$(pwd)"

# alias wazterm='wazterm --config-file .config/wazterm/wazterm.lua'
alias ws="workspace_switcher.sh"
