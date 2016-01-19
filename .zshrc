###########################
#
### Colors
#
###########################
autoload -U colors
colors

###########################
#
### Completion
#
###########################
autoload -U compinit
compinit


zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 2

zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format "%U%B%d%b%u"
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle ':completion:*' menu select

zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

setopt completealiases


###########################
#
### Options
#
###########################

#Not having to type "cd" to change directory
setopt AUTO_CD

###########################
#
### History
#
###########################


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_space


setopt extendedglob notify
bindkey -v


### correction
setopt correctall


###########################
#
### Functions
#
###########################




### Prepend sudo at commantline at double escape
#taken from:  oh-my-zsh/plugins/sudo/sudo.plugin.zsh
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
  zle end-of-line
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line


############################
#
### Key Bindings
#
############################

autoload zkbd
if [[ -r  ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] then
    source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
else
    source ~/.zkbd/default
fi

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


###########################
#
### Prompt
#
###########################
TERM=xterm

autoload -U promptinit
promptinit
#prompt redhat


### r prompt
setopt prompt_subst

function git_dirty {
	counter=$(git -C $(pwd) status --porcelain 2> /dev/null |grep --count M)
	if [ $counter != "0" ]; then
		echo " (Modified: $counter)"
	fi
}

### Add time to promt
#taken from https://coderwall.com/p/kmchbw 
function preexec() { 
  timer=${timer:-$SECONDS} 
} 
function precmd() { 
  if [ $timer ]; then timer_show=$(($SECONDS - $timer)) 
     export RPROMPT="%F{cyan}(${timer_show}s)$(git_dirty) %{$reset_color%}"
     unset timer 
  fi 
}


### l Prompt
# adapted from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
local SEGMENT_SEPARATOR=""
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
export smiley="%(?,%F{green}OK%f,%F{red}ERROR%f)"
export PROMPT='%{$fg[black]%}%{$bg[green]%}%n@%m%{$fg[green]%}%{$bg[cyan]%}$(echo $SEGMENT_SEPARATOR)%{$fg[black]%}%{$bg[cyan]%}$(collapse_pwd) $smiley %{$fg[cyan]%}%{$bg[black]%}$(echo $SEGMENT_SEPARATOR)%{$reset_color%}'

###########################
#
### Appendix
#
###########################

source ~/.aliases
