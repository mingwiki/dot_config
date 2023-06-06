let g:proxy_http = 'socks5h://0.0.0.0:20000'
let g:proxy_https = 'socks5h://0.0.0.0:20000'
let g:airline#extensions#tabline#enabled = 1

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'navarasu/onedark.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons'       " vimscript
Plug 'preservim/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
call plug#end()

:lua require('config')
:lua require('Comment').setup()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
set number
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
set clipboard=unnamedplus
set noswapfile
