""""""""""""""""""""""""""""""""""""""
" => General 
"""""""""""""""""""""""""""""""""""""" 

" History that Vim remembers
set history=500
"Filetype plugins
filetype plugin on
filetype indent on

" Loads changes when file is modified outside of Vim
set autoread

"""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""" 

" set 7 lines to the cursor when using j/k
set so=7


" Activate the wild menu
set wildmenu

"always show position
set ruler

" set height of command bar
set cmdheight=2

" A buffer becomes hidden when abandoned
set hid

"Make backspace great again
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"ignore case when search
set ignorecase

"Be smart when search
set smartcase

" highlight search
set hlsearch

" search like browsers
set incsearch

set lazyredraw
set magic

"Matching brackets
set showmatch
set mat=2


set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

set number
"""""""""""""""""""""""""""""""""
" => Colors and fonts and shit
"""""""""""""""""""""""""""""""""

syntax enable

try
	colorscheme solarized
catch
endtry

set background=light

if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" utf_8 as standard
set encoding=utf8

set ffs=unix,mac,dos


""""""""""""""""""""""""""""""
" => Backups ? 
""""""""""""""""""""""""""""""

"Backups off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""
" => Tabs and spaces
""""""""""""""""""""""""""""" 

set expandtab
"set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500

""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""" 

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""" 

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    endif
    return ''
endfunction

""""""""""""""""""""""""""""""""
" => Specific configurations
""""""""""""""""""""""""""""""""
" For the greatness of arrows in airline
let g:airline_powerline_fonts = 1

"Open nerd tree if no file is indicated
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Modify update time on Vim, for git gutter
set updatetime=100

" Indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""
" => Headers 
""""""""""""""""""""""""""""""""

autocmd bufnewfile *.c so /home/sebastien/.config/nvim/tek_header
autocmd bufnewfile *.c exe "1," . 6 . "g/File Name :.*/s//File Name : ".expand("%")
autocmd bufnewfile *.c exe "1," . 6 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 6 . "g/Last Modified :.*/s//Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

" Ruler at 80 columns
set colorcolumn=80

""""""""""""""""""""""""""""""""
" => Plug Ins
"""""""""""""""""""""""""""""""" 

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sbdchd/neoformat'
call plug#end()
