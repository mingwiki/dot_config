alias sp='export {http,https,ftp,rsync,all}_proxy=socks5h://\[::\]:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://\[::\]:20000'
alias wsp='export {http,https,ftp,rsync,all}_proxy=socks5h://10.10.10.10:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://10.10.10.10:20000'
alias unsp='unset {http,https,ftp,rsync,all}_proxy; unset {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY'
alias sz='source ~/.zshrc'
alias wt='watch -n 1 tail -n 10'
alias pc='proxychains4'
alias bcaddy='hup xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=$PWD --with github.com/mholt/caddy-webdav --with github.com/caddy-dns/cloudflare'
alias fcaddy='caddy fmt /etc/caddy/Caddyfile /etc/caddy/4fm /etc/caddy/naizi --overwrite && caddy validate --config /etc/caddy/Caddyfile'
alias dlp='yt-dlp -f "bv+ba" --merge-output-format mp4'
alias dl_playlist='dlp_batch'
alias yt_playlist='yt_batch'
alias yt='yt_single'
alias mv='mv -iuv'
alias grep='rg'
alias ls='exa'
alias e='nvim'
alias cd='z'
alias curl='curlie'
alias paru='sudo -u ming paru'
alias s='screen -L -Logfile /var/log/screen.log'

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

dlp_batch() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'dlp_batch' missing batch file"
    return 1
  else
    hup yt-dlp --merge-output-format mp4 --verbose --no-check-certificates --yes-playlist --download-archive archive.txt --cookies cookie.txt -o "%(playlist)s/%(title)s.%(ext)s" --batch-file $1
  fi
}
yt_batch() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'yt_batch' missing batch file"
    return 1
  else
    hup yt-dlp --merge-output-format mp4 --proxy socks5h://10.10.10.10:20000 --write-subs --write-auto-subs --embed-thumbnail --embed-metadata --embed-chapters --no-progress --verbose --no-check-certificates --yes-playlist --download-archive archive.txt --cookies cookie.txt -o "%(playlist)s/%(title)s.%(ext)s" --batch-file $1
  fi
}
yt_single() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'yt_single' missing batch file"
    return 1
  else
    hup yt-dlp --merge-output-format mp4 --proxy socks5h://10.10.10.10:20000 --write-subs --write-auto-subs --embed-thumbnail --embed-metadata --embed-chapters --verbose --no-check-certificates --download-archive archive.txt --cookies cookie.txt -o "%(title)s.%(ext)s" --batch-file $1
  fi
}
