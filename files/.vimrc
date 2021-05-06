execute pathogen#infect()
filetype plugin indent on
syntax on
nnoremap / /\v
vnoremap / /\v

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set scrolloff=3
set autoindent
set shiftwidth=4
set tabstop=4
set showmatch
set ruler
set incsearch
set nocompatible
set showcmd
highlight matchparen ctermbg=red
set modeline
set modelines=5
set hlsearch

set background=dark
colorscheme solarized

"set cindent
"set cinkeys-=0#
"set indentkeys-=0#
"
let g:sql_type_default = 'pgsql'

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
