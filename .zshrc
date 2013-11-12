export LANG=ja_JP.UTF-8

PATH=/usr/local/bin:$PATH
PATH=$PATH:~/.rbenv/bin
load_file() {
  if [ -f $1 ]; then
    source $1
  fi
}
PROMPT=$'\[%F{blue}%B%n%f:%F{cyan}%~%b%f\]\$ '

eval "$(rbenv init -)"
# git completion with installed git on homebrew.
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"
# core util
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

eval $(gdircolors ~/.dircolors-solarized/dircolors.ansi-universal)
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# zsh increment complete
ZSH_INCREMENT_COMPLETE_FILE="$HOME/.zsh/incr-0.2.zsh"
load_file $ZSH_INCREMENT_COMPLETE_FILE

# zsh local environments file
LOCAL_ENV_FILE="$HOME/.zshrc.local"
load_file $LOCAL_ENV_FILE

# keybind: vim style
bindkey -v
