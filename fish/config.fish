set -x PYENV_ROOT "$HOME/.pyenv"
set -x PATH $HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/go/bin:$PATH
set -x DOCKER_CLIENT_TIMEOUT 120
set -x COMPOSE_HTTP_TIMEOUT 120
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x GO111MODULE on
set -x GOSUMDB off
set -x RUST_BACKTRACE 1
set -x EDITOR nvim
set -x TERM xterm-256color 
set -x COLORTERM truecolor
set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -x RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup

function dp_sync
    pyenv activate $argv
    if test (pip freeze | grep -v -f requirements.txt | wc -l) -gt 0
        pip freeze | grep -v -f requirements.txt - | xargs pip uninstall -y
    end
    pip install -r requirements.txt &>>/var/log/sync.log
end

function sp
    set -gx http_proxy socks5://proxy:20000
    set -gx https_proxy socks5://proxy:20000
    set -gx ftp_proxy socks5://proxy:20000
    set -gx rsync_proxy socks5://proxy:20000
    set -gx all_proxy socks5://proxy:20000
end

function unsp
    set --erase http_proxy
    set --erase https_proxy
    set --erase ftp_proxy
    set --erase rsync_proxy
    set --erase all_proxy
end

function wt
    watch -n 1 tail -n 10 $argv
end

function e
    if command -v code >/dev/null
        code $argv
    else if command -v nvim >/dev/null
        nvim $argv
    else
        vi $argv
    end
end

function v
    if command -v moar >/dev/null
        moar $argv
    else
        less -RFX $argv
    end
end

function bcaddy
    xcaddy build master \
        --with github.com/caddyserver/forwardproxy@caddy2 \
	--with github.com/mholt/caddy-webdav \
        --with github.com/caddy-dns/cloudflare
end

function fcaddy
    caddy fmt /etc/caddy/Caddyfile --overwrite
    caddy validate --config /etc/caddy/Caddyfile
end

function g
    rg -p $argv | less -RFX
end

function ff
    ruff check --select I --fix **/**/*.py && ruff format
end

function tk
    tmux kill-session -a
end

zoxide init fish | source
fnm env --use-on-cd --shell fish | source
pyenv init - fish | source
pyenv virtualenv-init - | source

# pnpm
set -gx PNPM_HOME "/root/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
