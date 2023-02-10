[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# Example install plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"

#Example plugin pinned to specifc commit or branch, just pass the git reference
plug "zsh-users/zsh-syntax-highlighting" "122dc46"

# Example theme
plug "shadowelite-sec/atmachine-prompt"
plug "zap-zsh/completions"
plug "hlissner/zsh-autopair"
plug " zap-zsh/sudo"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#eval "$(starship init bash)"
#PS1='[\u@\h \W]\$ '

# export
export PATH=$PATH:$HOME/.local/bin
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# alias
alias icat="kitty +kitten icat"
alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
alias zathura="~/.local/bin/zathura"
alias ip="ifconfig | grep inet | head -n3  | tail -n1"
alias hs="history | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | xclip -selection c"
alias grep="grep --color"
alias pacman="pacman --color auto"

#shortcuts
gp(){
grep -ir "$1"
}

f(){    
        find $1 -name "$2" 2>/dev/null    
}    
fcd(){    
    
        cd $(find $HOME -type d | fzf)    
    
}    
    
fop(){    
    
        nano $(find $HOME -type f | fzf)    
    
}    

#wal
    
declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

