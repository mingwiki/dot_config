if status is-interactive
    # Commands to run in interactive sessions can go here
end

function sp
    set -gx http_proxy socks5h://10.10.10.10:20000
    set -gx https_proxy socks5h://10.10.10.10:20000
    set -gx ftp_proxy socks5h://10.10.10.10:20000
    set -gx rsync_proxy socks5h://10.10.10.10:20000
end
function lsp
    set -gx http_proxy socks5h://localhost:20000
    set -gx https_proxy socks5h://localhost:20000
    set -gx ftp_proxy socks5h://localhost:20000
    set -gx rsync_proxy socks5h://localhost:20000
end

function unsp
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
end

function wt
    watch -n 1 tail -n 10 $argv
end

function bcaddy
    hup xcaddy build \
        --with github.com/caddyserver/forwardproxy@caddy2=$PWD \
        --with github.com/mholt/caddy-webdav \
        --with github.com/caddy-dns/cloudflare
end

function fcaddy
    caddy fmt /etc/caddy/Caddyfile /etc/caddy/4fm /etc/caddy/naizi --overwrite
    caddy validate --config /etc/caddy/Caddyfile
end

function dlp
    yt-dlp -f "bv+ba" --merge-output-format mp4 $argv
end

function mv
    mv -iuv $argv
end


function ah
    sudo -u ming pikaur $argv
end

function e
    nvim $argv
end

function hup
    if test (count $argv) -eq 0
        echo "Error: 'nohup' requires at least one argument."
        return 1
    end

    set name "$argv[1]_$(date +'%Y%m%d_%H%M')"
    nohup "$argv[1]" &>>"$name.log" &
    tail -f "$name.log"
end

function dlp_batch
    if test (count $argv) -eq 0
        echo "Error: 'dlp_batch' missing batch file"
        return 1
    end

    hup yt-dlp \
        --merge-output-format mp4 \
        --verbose \
        --no-check-certificates \
        --yes-playlist \
        --download-archive archive.txt \
        --cookies cookie.txt \
        -o "%(playlist)s/%(title)s.%(ext)s" \
        --batch-file $argv
end

function yt_batch
    if test (count $argv) -eq 0
        echo "Error: 'yt_batch' missing batch file"
        return 1
    end

    hup yt-dlp \
        --merge-output-format mp4 \
        --proxy socks5h://10.10.10.10:20000 \
        --write-subs \
        --video-multistreams \
        --audio-multistreams \
        --sub-langs 'zh,en' \
        --write-auto-subs \
        --embed-thumbnail \
        --embed-metadata \
        --embed-chapters \
        --verbose \
        --no-check-certificates \
        --yes-playlist \
        --download-archive archive.txt \
        --cookies cookie.txt \
        -o "%(playlist)s/%(title)s.%(ext)s" \
        --batch-file $argv
end

function yt_single
    if test (count $argv) -eq 0
        echo "Error: 'yt_single' missing batch file"
        return 1
    end

    hup yt-dlp \
        --merge-output-format mp4 \
        --proxy socks5h://10.10.10.10:20000 \
        --write-subs \
        --video-multistreams \
        --audio-multistreams \
        --sub-langs
end

function unset
    set --erase $argv
end
