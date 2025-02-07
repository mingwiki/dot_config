set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"显示行号
set nu
set number

"突出显示当前行
set cursorline
set cul          "cursorline的缩写形式
"hi CursorLine   cterm=NONE ctermbg=LightCyan ctermfg=Cyan guibg=NONE guifg=NONE

"突出显示当前列
"set cursorcolumn
"set cuc          "cursorcolumn的缩写形式
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"显示括号匹配
set showmatch

"设置Tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"继承前一行的缩进方式，适用于多行注释
set autoindent

"设置粘贴模式
set paste

"显示空格和tab键
set listchars=tab:>-,trail:- ",eol:$
set list

"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler

filetype plugin indent on

"让vimrc配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
