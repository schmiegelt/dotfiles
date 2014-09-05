### Colors
autoload -U colors
colors


### Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 2

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle ':completion:*' menu select

zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

setopt completealiases
zstyle :compinstall filename '/home/philip/.zshrc'

autoload -U compinit
compinit

#Not having to type "cd" to change directory
setopt AUTO_CD



### history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space


setopt extendedglob notify
bindkey -v


### correction
setopt correctall

### prompt
autoload -U promptinit
promptinit
#prompt redhat

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

### r prompt
setopt prompt_subst
### Add time to promt
#taken from https://coderwall.com/p/kmchbw 
function preexec() { 
  timer=${timer:-$SECONDS} 
} 
function precmd() { 
  if [ $timer ]; then timer_show=$(($SECONDS - $timer)) 
     export RPROMPT="%F{cyan}(${timer_show}s) %{$reset_color%}"
     unset timer 
  fi 
}



### Prompt
# adapted from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
export smiley="%(?,%F{green}☺%f,%F{red}☹%f)"
export PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} $smiley »'

### Alias
alias grep='grep --color=auto'
