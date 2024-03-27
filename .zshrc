export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh
plugins=(emoji tmux encode64 fzf github history node systemd vi-mode zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting rsync copyfile dirhistory)
ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"
