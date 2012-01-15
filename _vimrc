


"
" general settings
"

" set initial values
set nocompatible        " must be first line
set background=dark     " Assume a dark background

" call pathogen
call pathogen#infect()

" set file types
filetype plugin indent on  	" Automatically detect file types.
syntax on 					" syntax highlighting
set mouse=a					" automatically enable mouse usage

" Set to auto read when a file is changed from the outside
set autoread

" Fast editing of the .vimrc
map <leader>e :e $MYVIMRC<cr>

" remap the esc key
map! ;; <Esc>

" not every vim is compiled with this, use the following line instead
" If you use command-t plugin, it conflicts with this, comment it out.
scriptencoding utf-8

" set autowrite                 " automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set virtualedit=onemore 	   	" allow for cursor beyond last character
set history=1000  				" Store a ton of history (default is 20)
"set spell 		 	        	" spell checking on

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
try
    if has('win32') || has('win64')
        set undodir=C:\Windows\Temp
    else
        set undodir=~/.viminfo/undodir
    endif
    
    set undofile
catch
endtry

" Handle window view state
au BufWinLeave * silent! mkview  	"make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview 	"make vim load view (state) (folds, cursor, etc)






"
" Vim UI 
"

color jellybeans   	       		" load a colorscheme
set tabpagemax=15 				" only show 15 tabs
set showmode                   	" display the current mode

set cursorline  				" highlight current line
hi cursorline guibg=#333333 	" highlight bg color of current line
"set cursorcolumn
"hi CursorColumn guibg=#333333  " highlight cursor


set backspace=indent,eol,start	" backspace for dummys
set linespace=0					" No extra spaces between rows
set nu							" Line numbers on
set showmatch					" show matching brackets/parenthesis
set incsearch					" find as you type search
set hlsearch					" highlight search terms
set winminheight=0				" windows can be 0 line high 
set ignorecase					" case insensitive search
set smartcase					" case sensitive when uc present

set wildmenu					" show list instead of just completing
set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to

set scrolljump=5 				" lines to scroll when cursor leaves screen
set scrolloff=3 				" minimum lines to keep above and below cursor

set foldenable  				" auto fold code
set gdefault					" the /g flag on :s substitutions by default

set list
set listchars=tab:» ,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

set showcmd 					"show incomplete cmds down the bottom
set showmode 					"show current mode down the bottom

" Autocommand to reload the status vim plugin for color changes
autocmd! ColorScheme *  source ~/.vim/bundle/statusline/plugin/statusline.vim


"
" Formatting
"

set nowrap                     	" wrap long lines
set autoindent                 	" indent at the same level of the previous line
set shiftwidth=4               	" use indents of 4 spaces
set expandtab 	  	     		" tabs are spaces, not tabs
set tabstop=4 					" an indentation every four columns
set softtabstop=4 				" let backspace delete indent
"set matchpairs+=<:>            " match, to be used with % 
set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
	
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" remove option that automatically inserts comment leader after hitting enter
setlocal formatoptions-=r


"
" Key (re)Mappings
"

"The default leader is '\', but many people prefer ',' as it's in a standard location
let mapleader = ','

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Move to current working directory for file in buffer
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

" The following two lines conflict with moving to top and bottom of the screen
" If you prefer that functionality, comment them out.
map <S-H> gT          
map <S-L> gt

" Stupid shift key fixes
cmap W w 
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Toggle window appearance
noremap <silent> <F8> :call ToggleFlag("guioptions","m")<BAR>set guioptions?<CR>
imap <F8> <C-O><F8>
noremap <silent> <F9> :call ToggleFlag("guioptions","T")<BAR>set guioptions?<CR>
imap <F9> <C-O><F9>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Tab Navigation
:nmap <C-S-tab> :tabprevious<cr>
:nmap <C-tab> :tabnext<cr>
:imap <C-S-tab> <ESC>:tabprevious<cr>i
:imap <C-tab> <ESC>:tabnext<cr>i
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>i
:map <C-w> :tabclose<cr>








"
" GUI Settings 
"

" GVIM- (here instead of .gvimrc)
if has('gui_running')
    set guioptions-=T          	" remove the toolbar
    set lines=40               	" 40 lines of text instead of 24,
else
    set term=builtin_ansi       " Make arrow and other keys work
endif

" Set font according to system
if has('mac')
    set gfn=Menlo:h12
    set shell=/bin/bash
elseif has('win32') || has('win64')
    set gfn=Consolas:h10
else
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif






"
" Plugins
"

" solarized options {
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
" }

" Supertab {
    let g:SuperTabDefaultCompletionType = "context"
    "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" }

" vim indent {
    set ts=4 sw=4 et
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
" }

" Tabularize {
    if exists(":Tabularize")
        nmap <leader>a= :Tabularize /=<CR>
        vmap <leader>a= :Tabularize /=<CR>
        nmap <leader>a: :Tabularize /:<CR>
        vmap <leader>a: :Tabularize /:<CR>
        nmap <leader>a:: :Tabularize /:\zs<CR>
        vmap <leader>a:: :Tabularize /:\zs<CR>
        nmap <leader>a, :Tabularize /,<CR>
        vmap <leader>a, :Tabularize /,<CR>
        nmap <leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <leader>a<Bar> :Tabularize /<Bar><CR>
    endif
" }

