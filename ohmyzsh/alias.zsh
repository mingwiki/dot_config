alias sp='export {http,https,ftp,rsync,all}_proxy=socks5h://127.0.0.1:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://127.0.0.1:20000'
alias wsp='export {http,https,ftp,rsync,all}_proxy=socks5h://10.10.10.110:20000; export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=socks5h://10.10.10.110:20000'
alias unsp='unset {http,https,ftp,rsync,all}_proxy; unset {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY'
alias cl='clear'
alias gl='glances'
alias sz='source ~/.zshrc'
alias mv='mv -iuv'
alias yt='youtube_cookie_batch'
alias bili='bilibili_cookie_batch'
alias ytn='ls */**/playlist.txt| xargs -n1| node yt.js &'
alias wt='watch tail -n 20'
alias setPip='pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple'
alias sd='python3 launch.py --xformers --listen --enable-insecure-extension-access --port=8888'
alias rg='rga'
alias grep='rga'
alias pc='proxychains'
alias pc4='proxychains4'
alias lg='lazygit'
alias vi='nvim'
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
    hup yt-dlp --proxy socks5://10.10.10.10:20000 --verbose --no-check-certificates --cookies /mnt/r10/cookie/youtube.txt --yes-playlist --download-archive archive.txt -o "%(playlist)s/%(title)s.%(ext)s" --batch-file $1
  fi
}
bilibili_cookie_batch() {
  if [[ $# -eq 0 ]]; then
    echo "Error: 'bilibili_cookie_batch' missing batch file"
    return 1
  else
    hup yt-dlp --verbose --no-check-certificates --cookies /mnt/r10/cookie/bilibili.txt --yes-playlist --download-archive archive.txt -o "%(playlist)s/%(title)s.%(ext)s" --batch-file $1
  fi
}
