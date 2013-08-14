export LANG=ja_JP.UTF-8

PATH=/usr/local/bin:$PATH
PATH=$PATH:~/.rbenv/bin
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
# zsh increment complete
source ~/.zsh/incr-0.2.zsh

# core util
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

eval $(gdircolors ~/.dircolors-solarized/dircolors.ansi-universal)
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# zsh local environments file
if [ eval $(test ~/.zshrc.local) ]; then
  source ~/.zshrc.local
fi
