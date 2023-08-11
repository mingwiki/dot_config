export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh
plugins=(git deno thefuck adb z docker docker-compose docker-machine emoji encode64 fzf github golang history kubectl microk8s minikube man nmap node npm pip systemd vim-interaction vi-mode virtualenv vscode zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting rsync ruby rust rvm copyfile dirhistory)
eval $(thefuck --alias)
source $ZSH/oh-my-zsh.sh
neofetch
