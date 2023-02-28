" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: ghanquer <marvin@42.fr>                    +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2023/02/28 17:39:23 by ghanquer          #+#    #+#              "
"    Updated: 2023/02/28 16:52:27 by ghanquer         ###   ########.fr        "
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
"au FileType c,cpp,objc,objcpp call rainbow#load()
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

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Thodore's cpp things
" => He had fun but not really working fine
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function s:protec(string)
	let str = a:string[:-5] . "_" . a:string[-3:]
	let tmp = getline(13)
	if (tmp != "#ifndef " . toupper(str))
		echo "#ifndef " . toupper(str)
		call append(12, "#ifndef " . toupper(str))
	endif
	let tmp = getline(14)
	if (tmp != "# define " . toupper(str))
		call append(13, "# define " . toupper(str))
	endif
	execute "normal! G"
	let tmp = getline('.')
	if (tmp != "#endif")
		execute "normal! o"
		call append('.', "#endif")
	endif
endfunction

function s:canon(name, ...)
	let class = a:name
	let ret = []
	call add(ret, "	public:")
	call add(ret, "		" . class . "(void);")
	call add(ret, "		" . class . "(const " . class . " &);")
	call add(ret, "		~" . class . "(void);")
	call add(ret, "		" . class . " & operator=(" . class . " &);")
	let vars = a:000[0]
	for var in vars
		let var[-1] = toupper(var[-1][1]) . var[-1][2:]
		let type = ""
		for seg in var[:-2]
			if type == ""
				let type = type . seg
			else
				let type = type . ' ' . seg
			endif
		endfor
		if index(var, "const") == -1
			call add(ret, "		" . "void" . " set" . var[-1] . "(" . type . ");")
		endif
		call add(ret, "		" . type . " get". var[-1] . "(void);")
	endfor
	execute "normal! Gk"
	call append('.', ret)
	return ret
endfunction

function s:putf(name, ...)
	let lst = a:000[0]
	let ret = []
	"if (len(lst[0]) == 1 || stridx(lst[0], ")") != -1)
	"	call add(ret, " ")
	"endif
	let name = tolower(a:name[0]) . a:name[1:]
	let ret += lst + ['{']
	let ret = join(ret)
	let i = 0
	while (ret[i] != '(')
		let i += 1
	endwhile
	let j = 0
	while (ret[j] != ')')
		let j += 1
	endwhile
	if (stridx(lst[0], "(") != -1)
		let ret = [a:name . "::" . ret]
	elseif (ret[i + 1:j- 1] == "void")
		let k = i
		while (ret[k] != ' ' && k)
			let k -= 1
		endwhile
		let varname = tolower(ret[k + 1:i - 1][3]) . ret[k + 1:i - 1][4:]
		let type = ret[k + 1:i - 1][0:2]
		let ret = [ret[:k] . a:name . "::" . ret[k+1:]]
		if (type == "get")
			let ret += ["	return (this->" . "_" . varname . ");"]
		endif
	else
		let k = i
		while (ret[k] != ' ' && k)
			let k -= 1
		endwhile
		let type = ret[k + 1:i - 1][0:2]
		if (type == "set")
			let varname = tolower(ret[k + 1:i - 1][3]) . ret[k + 1:i - 1][4:]
			let ret = [ret[:k] . a:name . "::" . ret[k + 1:i - 1] . ret[i:j - 1] . " " . varname . ret[j:]]
			let ret += ["	this->" . "_" . varname . " = " . varname . ";"]
		else
			let ret = [ret[:k] . a:name . "::" . ret[k + 1:i - 1] . ret[i:j - 1] . " " . name . ret[j:]]
		endif
	endif
	let ret += ["}"]
	return (ret)
endfunction

function s:createcpp(name, ...)
	let lst = a:000[0]
	let name = a:name . ".cpp"
	let ret = []
	if (filereadable(name))
		echo "Already an existing " . name
		return
	endif
	for func in lst[1:]
		call add(ret, s:putf(name[:-5], split(func[2:-2])))
	endfor
	execute 'tabedit' name
	for line in reverse(ret)
		call append('.', line)
		call append('.', "")
	endfor
	execute "Stdheader"
	if ("#include \"" . name[:-4] . "h" . name[-2:] . "\"" != getline('.'))
		execute "normal! " . "i#include \"" . name[:-4] . "h" . name[-2:] . "\""
	endif
	execute "x"
endfunction

function s:getlst(file)
	let lines = readfile(a:file)
	let lst = []
	let start = 0
	for line in lines
		if line == "};" || line == "	public:"
			break
		endif
		if start
			call add(lst, split(line[2:-2]))
		endif
		if line == "	private:" || line == "	protected:"
			let start = 1
		endif
	endfor
	return reverse(lst)
endfunction

function! Test()
	let str = expand("%:f")
	let lst = split(str, '\.')
	execute "Stdheader"
	if (lst[-1] == "hpp")
		call s:createcpp(lst[0], s:canon(lst[0], s:getlst(str)))
		call s:protec(str)
		execute "w"
		execute "tabedit" lst[0] . ".cpp"
	endif

endfunction

:command! Canon :call Test()