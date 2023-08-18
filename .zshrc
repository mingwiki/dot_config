export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh
plugins=(git thefuck adb z docker docker-compose docker-machine emoji encode64 fzf github history kubectl man nmap node npm pip systemd vim-interaction vi-mode vscode zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting rsync rust copyfile dirhistory)
eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
neofetch
