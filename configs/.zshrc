# https://ohmyposh.dev/docs/themes

# theming
eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin_frappe.omp.json)"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

# electron stuff
export ELECTRON_OZONE_PLATFORM_HINT=auto

# startup
fastfetch

# home and end
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" history-search-backward
bindkey "^[[6~" history-search-forward

# plugins
source ~/.config/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh