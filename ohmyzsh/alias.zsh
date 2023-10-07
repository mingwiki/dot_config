alias sp='export {http,https,ftp,rsync,all}_proxy=socks5h://127.0.0.1:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://127.0.0.1:20000'
alias wslsp='export {http,https,ftp,rsync,all}_proxy=socks5h://10.10.10.10:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://10.10.10.10:20000'
alias unsp='unset {http,https,ftp,rsync,all}_proxy; unset {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY'
alias sz='source ~/.zshrc'
alias mv='mv -iuv'
alias yt='youtube_cookie_batch'
alias bili='bilibili_cookie_batch'
alias wt='watch tail -n 20'
alias sd='python3 launch.py --ckpt-dir=/home/data/ckpt --lora-dir=/home/data/lora --xformers --listen --enable-insecure-extension-access --port=8888'
alias grep='rg'
alias pc='proxychains4'
alias vi='nvim'
alias vim='nvim'
alias ls='exa'
alias docker='podman'
alias p='podman-compose'
alias bcaddy='hup xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=$PWD --with github.com/mholt/caddy-webdav --with github.com/caddy-dns/cloudflare'
hup() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'nohup' requires at least one argument."
    return 1
  else
    name="$1"_"$(date +"%Y%m%d_%H%M")"
    nohup "$@" &>> $name.log &
    tail -F $name.log
  fi
}
youtube_cookie_batch() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'youtube_cookie_batch' missing batch file"
    return 1
  else
    hup yt-dlp --proxy socks5://0.0.0.0:20000 --verbose --no-check-certificates --cookies /home/root/youtube.txt --yes-playlist --download-archive archive.txt -o "%(playlist)s/%(title)s.%(ext)s" --batch-file $1
  fi
}
