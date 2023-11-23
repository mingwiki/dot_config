export PATH=$HOME/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/go/bin:$PATH
export NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
export NODIST_NODE_MIRROR=https://npmmirror.com/mirrors/node/
export NODE_MIRROR='https://mirrors.ustc.edu.cn/node/'
export NVM_NODEJS_ORG_MIRROR='https://mirrors.ustc.edu.cn/node/'
export NVMW_NODEJS_ORG_MIRROR='https://mirrors.ustc.edu.cn/node/'
export N_NODE_MIRROR='https://mirrors.ustc.edu.cn/node/'
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120
export ZSH_THEME="powerlevel10k/powerlevel10k"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export HISTSIZE=2000
export SAVEHIST=2000
export ZSHZ_CASE=smart
export GO111MODULE=on
export GOPROXY="https://goproxy.cn"
export EDITOR="nvim"
# pnpm
export PNPM_HOME="/home/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
