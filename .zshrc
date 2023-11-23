export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh
plugins=(podman emoji encode64 fzf github history node systemd vi-mode vscode zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting rsync copyfile dirhistory)
neofetch
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"
