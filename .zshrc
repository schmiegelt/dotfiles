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

setopt completealiases
zstyle :compinstall filename '/home/philip/.zshrc'

autoload -Uz compinit
compinit

#Not having to type "cd" to change directory
setopt AUTO_CD

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob notify
bindkey -v


### correction
setopt correctall

### prompt
autoload -U promptinit
promptinit
prompt redhat

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
