:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set clipboard=unnamedplus
:set cursorline

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary' "gcc / gc
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround' "surrounding ysw
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'neoclide/coc.nvim'
Plug 'ap/vim-css-color'

set encoding=UTF-8

call plug#end()

"=================
"== Colorscheme ==
"=================

:colorscheme atom

"==============
"== Terminal ==
"==============

" open with insert mode
autocmd TermOpen * startinsert

if has('nvim')
	" :T : vertical split
	command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

	" ctrl + q : close terminal
	tnoremap <C-q> <C-\><C-n>:q<CR>
	
	" @t : open in new tab 
	nnoremap @t :tabe<CR>:terminal<CR>
	
	" esc : terminal mode to normal mode
	tnoremap <ESC> <C-\><C-n>
endif

"============
"== Tagbar ==
"============

nmap <F8> :TagbarToggle<CR>

"==============
"== air-line ==
"==============

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"==============
"== NERDTree == 
"==============

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"=============
"== Devicon == 
"=============

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

" after a re-source, fix syntax matching issues (concealing brackets):

if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

"===============
"== Autopairs ==
"===============

lua << EOF
require("nvim-autopairs").setup {}
EOF

"==============
"== Coc.nvim ==
"==============

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"




