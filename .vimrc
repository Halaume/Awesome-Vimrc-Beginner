" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: ghanquer <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2023/02/28 17:39:23 by ghanquer          #+#    #+#              "
"    Updated: 2023/02/28 17:23:34 by ghanquer         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

"""""""""""""""""""""""""""""""""""""""""""""""""
" 42 Norm
"""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=80
highlight ColorColumn guibg=lightgrey

"ctermbg=0 guibg=lightgrey
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM -> NVIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
	set ai "Auto indent
	set autoread
	set smarttab
endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Animation Still have to work on that
"Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'

" Theming
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepom/vim-rainbow'

" Filetype specific plugins
Plug 'vim-syntastic/syntastic'

" Git utils
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin's settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VIM-CPP-MODERN
"au FileType c,cpp,objc,objcpp call rainbow#load()
"
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1
"END VIM-CPP-MODERN


let g:rainbow_active = 1

let g:user42 = 'ghanquer'
let	g:mail42 = 'ghanquer@student.42.fr'

let g:rainbow_load_separately = [
			\ [ '*' , [['(', ')'], ['{', '}']] ],
			\ [ '*.tex' , [['(', ')'], ['{', '}']] ],
			\ [ '*.cpp' , [['(', ')'], ['{', '}']] ],
			\ [ '*.{html,htm}' , [['(', ')'], ['{', '}']] ],
			\ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['darkcyan', 'darkgrey', 'brown', 'darkmagenta']
" For hpp errors show
let g:syntastic_cpp_check_header = 1

let g:lens#disabled = 1
" for auto resizing
set winwidth=93
set winheight=45

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" toggle mouse
:set mouse=a

" toggle hybrid line numbers
:set number! relativenumber!
:highlight LineNr ctermfg=grey

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤

" Coloring whitespace characters
hi NonText guifg=darkgrey ctermfg=darkgrey
" Coloring tab
hi SpecialKey guifg=darkgrey ctermfg=darkgrey

" Some unworking tests
":hi Myendline guifg=darkgrey ctermfg=darkgrey
":match Myendline /¬/

" highlighting Tabs
set fillchars=vert:│

" Enable syntax highlighting
syntax enable

set background=dark

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme iceberg
catch
endtry


" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keep undo even after vim close 
" => !Make sure to create the directory yourself
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vimundo/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Write the file when we leave the buffer
set autowrite

" Make backspace behave as expected
set backspace=eol,indent,start

set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rmapping <leader> to ','
:let mapleader = ","
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-x> <C-W>x
map <C-=> <C-W>=

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character and $ to EOL
nnoremap 0 ^
nnoremap m $
nnoremap t :tabNext <CR>
nnoremap w :w <CR>
nnoremap wq :wq <CR>
"Ugly but functionnal way to comment a line with '//'
nnoremap <silent><leader>n :s!^!//!<cr>:noh<cr>

" edit in visual block with simple 'i'
vnoremap <expr> i mode()=~'\cv' ? 'i' : 'I'

" leave term mode with <Esc>
tnoremap <Esc> <C-\><C-n>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

nnoremap <silent> <Leader>ve :sp ~/.vim/.vimrc<CR>

nnoremap <silent> <Leader>vs :source ~/.vim/.vimrc<CR>

autocmd VimEnter * ++nested
      \   if argc() is# 0
      \ |   edit ~/.vim/.vimrc
      \ | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Add Syntastic compiler flags and include directories
let g:syntastic_c_compiler_options = '-Wall -Wextra -Werror -Wpedantic -Wformat=2 -Wformat-overflow=2 -Wformat-truncation=2 -Wstringop-overflow=4 -Winit-self -ftrapv -Wdate-time'
let g:syntastic_c_include_dirs = ['../inc', 'inc']

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
