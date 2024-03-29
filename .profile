# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

test -t 0 && mesg n 2> /dev/null || true
. "$HOME/.cargo/env"

complete -C /usr/bin/aliyun aliyun
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
