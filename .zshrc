
### basicly setting
### code
export LANG=ja_JP.UTF-8

### color
autoload colors
colors

### prompt
# 通常時
PROMPT="%F{red}%B[%d] > %b%f"

### autocomplete
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select=2        # ctrl-f,ctrl-bで補完候補を移動
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

### incremental auto complete setting


### auto-fu.zshの設定
#source ~/auto-fu.zsh/auto-fu.zsh
#function zle-line-init () {
#     auto-fu-init
#}
#zle -N zle-line-init
# -azfu-を表示しない
#zstyle ':auto-fu:var' postdisplay $''
#zstyle ':completion:*' completer _oldlist _complete

### npm completion
#npm completion

### command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

### cdr setting
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

### PATH
# OpenNI2
source /Users/miyajimatakeshi/OpenNI2/OpenNIDevEnvironment
source /Users/miyajimatakeshi/NiTE-2.0.0/NiTEDevEnvironment


### peco
# ls alias
if [ -x "`which peco`" ]; then
	alias ll='ls -la | peco'
fi

# cd history


### incremental search 
source ~/zsh/incr/incr*.zsh

### z setting
_Z_CMD=j
source ~/z/z.sh
precmd() {
  _z --add "$(pwd -P)"
}

### peco + cdr setting
function peco-cdr() {
  local selected_dir=$(cdr -l | awk '{ print $2  }' | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
	zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cdr
bindkey '^t' peco-cdr


# nvm setting
export NVM_DIR="/Users/miyajimatakeshi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v5.4.1
eval "`npm completion`"

# memo setting
alias memo='vi ~/memo/memo.md'

