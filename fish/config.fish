set -x PATH $HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/go/bin:$PATH
set -x DOCKER_CLIENT_TIMEOUT 120
set -x COMPOSE_HTTP_TIMEOUT 120
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x GO111MODULE on
set -x GOSUMDB off
set -x EDITOR vim
set -x TERM xterm-256color 
set -x COLORTERM truecolor
set -x ZELLIJ_AUTO_ATTACH true
set -x ZELLIJ_AUTO_EXIT true
if status is-interactive
    #    eval (zellij setup --generate-auto-start fish | string collect)
end


function sp
    set -gx http_proxy socks5://proxy:10808
    set -gx https_proxy socks5://proxy:10808
    set -gx ftp_proxy socks5://proxy:10808
    set -gx rsync_proxy socks5://proxy:10808
    set -gx all_proxy socks5://proxy:10808
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
    if command -v moor >/dev/null
        moor $argv
    else
        less -RFX $argv
    end
end

function bcaddy
    xcaddy build master \
        --with github.com/caddyserver/forwardproxy@caddy2 \
	--with github.com/mholt/caddy-webdav
end

function fcaddy
    caddy fmt --overwrite $argv
    caddy validate --config $argv
end

function yt-dlp-playlist-mp3 --description '下载YouTube播放列表（使用代理）'
    # 设置代理服务器
    set -l proxy_server "socks5://10.10.10.20:10808"
    set -l download_archive "downloaded_archive.txt"
    
    # 设置下载选项
    set yt_dlp_opts
    set -a yt_dlp_opts -x
    set -a yt_dlp_opts --audio-format "aac"
    set -a yt_dlp_opts --audio-quality 0
    set -a yt_dlp_opts --proxy $proxy_server
    set -a yt_dlp_opts -o "%(playlist_title)s/%(title)s.%(ext)s"
    set -a yt_dlp_opts --embed-metadata
    set -a yt_dlp_opts --add-metadata
    set -a yt_dlp_opts --download-archive $download_archive
    
    # 检查是否提供了URL参数
    if test (count $argv) -eq 0
        echo "用法: yt-dlp-playlist-mp3 <YouTube播放列表URL>"
        echo "示例: yt-dlp-playlist-mp3 https://www.youtube.com/playlist?list=XXXXXXXXX"
        return 1
    end
    
    set -l playlist_url $argv[1]
    
    echo "开始下载播放列表..."
    echo "代理: $proxy_server"
    echo "URL: $playlist_url"
    echo "正在检查播放列表信息..."
    
    # 先获取播放列表信息而不下载
    yt-dlp --proxy $proxy_server --flat-playlist --print "%(playlist_title)s" $playlist_url
    
    # 执行下载
    echo "开始下载MP3音频文件..."
    if yt-dlp $yt_dlp_opts $playlist_url
        echo "✅ 播放列表下载完成！"
        echo "文件已保存在以播放列表名称命名的文件夹中"
    else
        echo "❌ 下载过程中出现错误"
        return 1
    end
end

zoxide init fish | source
fnm env --use-on-cd --shell fish | source
atuin init fish | source
source "$HOME/.cargo/env.fish"

# pnpm
set -gx PNPM_HOME "/home/mingwiki/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
set -x RUSTUP_UPDATE_ROOT https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
