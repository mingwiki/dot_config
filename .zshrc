export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/ohmyzsh
# pnpm
export PNPM_HOME="/home/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
plugins=(z podman emoji encode64 fzf github history node npm pip systemd vi-mode vscode zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting rsync copyfile dirhistory)
neofetch
source $ZSH/oh-my-zsh.sh
