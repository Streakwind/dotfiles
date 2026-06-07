# https://ohmyposh.dev/docs/themes

eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin_frappe.omp.json)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

export ELECTRON_OZONE_PLATFORM_HINT=auto

fastfetch

source ~/.config/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh