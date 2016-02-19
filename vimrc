"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle configuration 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Installed plugins

Plugin 'a.vim'
Plugin 'tpope/vim-sensible'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
"if v:version >= 703
    "Plugin 'airblade/vim-gitgutter'
"endif
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'camelcasemotion'
Plugin 'justinmk/vim-sneak'
"Plugin 'scrooloose/syntastic'
Plugin 'guyon/TabBar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'valloric/YouCompleteMe'
Plugin 'wincent/command-t'
"Plugin 'Lokaltog/vim-easymotion'

call vundle#end()

filetype plugin indent on     " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l  " What is it?

" When searching try to be smart about cases 
set ignorecase
set smartcase

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
" set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Set title of terminal window
set title

" Enable mouse
set mouse=a

" Show line numbers
set number

" I-style cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Longer window split line
set fillchars=stl:\ ,stlnc:\ ,vert:│


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Colors independent from 16-color scheme
let g:solarized_termcolors=256

set background=dark
"colorscheme solarized

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Colors for sign column
highlight SignColumn guibg=none ctermbg=none
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wrap

set autoindent
set cindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " " " \ - is a default
"let g:mapleader = "\\"

" enable normal bindings in cyrillic locale
set langmap=йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;qwertyuiop[]asdfghjkl;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Cycling through buffers
map <C-S-J> :bn<CR>
map <C-S-K> :bp<CR>

" Allow to switch windows directly from insert mode
imap <C-W> <esc><C-W>

" Restore selection after changing indentation
vmap < <gv
vmap > >gv

"Switch buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Toggle correcting tabs on copy-pasting
set pastetoggle=<Leader>p

noremap <leader>t :CommandT .<CR>
noremap <leader>T :CommandT<CR>

" NEDRTree
noremap <leader>n :NERDTreeToggle<CR>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Convert case by ~
set tildeop

" Toggle relative line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <leader>N :call NumberToggle()<cr>

" Toggle unprintable characters visibility
if has('multi_byte')
    if version >= 700
        " set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
        set listchars=tab:▸\ ,eol:¬ " TextMate
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif
nmap <leader>l :set list!<CR>

" Needed to remap wbe to CamelCase motion instead of by word
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Some extras
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%


" Tune Command-T
let g:CommandTMaxFiles=1000000
let g:CommandTMaxCachedDirectories=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Enable beautiful tab bar
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1


" > in fonts
let g:airline_powerline_fonts = 1

