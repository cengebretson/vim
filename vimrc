"--------------------------"
" Version 1.3              "
" Last Changed: 05/04/2012 "
"--------------------------"


"------------------"
" General Settings "
"------------------"

" call pathogen
call pathogen#infect()

" set file types
filetype plugin indent on  " Automatically detect file types.
syntax on                  " syntax highlighting

" set initial values
set nocompatible           " must be first line
set background=dark        " Assume a dark background
set mouse=a                " automatically enable mouse usage
set autoread               " Set to auto read when a file is changed from the outside
set shortmess+=filmnrxoOtT " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore    " allow for cursor beyond last character
set history=1000           " Store a ton of history (default is 20)

" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

" Handle window view state
au BufWinLeave * silent! mkview   " make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview " make vim load view (state) (folds, cursor, etc)

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" Treat eco/jeco same as html
au BufNewFile,BufRead *.jeco set ft=html
au BufNewFile,BufRead *.eco set ft=html

" Change to directory of file that is currently in the buffer
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing white space when saving
autocmd BufWritePre * :%s/\(\S\)\s\+$/\1/e




"----------"
"  VIM UI  "
"----------"

color mustang                  " load a colorscheme

set showmode                   " display the current mode
set showcmd                    " show incomplete cmds down the bottom

set cursorline                 " highlight current line
hi cursorline guibg=#333333
set cursorcolumn
hi cursorcolumn guibg=#262626

set backspace=indent,eol,start " backspace settings
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " show matching brackets/parenthesis
set incsearch                  " find as you type search
set hlsearch                   " highlight search terms
set gdefault                   " the /g flag on :s substitutions by default
set winminheight=0             " windows can be 0 line high
set ignorecase                 " case insensitive search
set smartcase                  " case sensitive when uc present

set wildmenu                   " show list instead of just completing
set wildmode=list:longest,full " command <Tab> completion, list matches, then longest common part, then all.
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set scrolljump=5               " lines to scroll when cursor leaves screen
set scrolloff=3                " minimum lines to keep above and below cursor

set list                       " Highlight problematic whitespace
set listchars=tab:��,trail:.,extends:#,nbsp:.

" Autocommand to reload the status vim plugin for color changes
autocmd! ColorScheme *  source ~/.vim/bundle/statusline/plugin/statusline.vim

" use system clipboard for copy/paste
set clipboard=unnamed





"------------"
" Formatting "
"------------"

set nowrap                    " wrap long lines
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set autoindent                " indent at the same level of the previous line
set shiftwidth=4              " use indents of 4 spaces
set noexpandtab               " tabs are tabs, not spaces
set tabstop=4                 " an indentation every four columns
set softtabstop=4             " let backspace delete indent

" remove option that automatically inserts comment leader after hitting enter
autocmd! FileType * setlocal formatoptions-=r
autocmd FileType * set noexpandtab

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab




"------------------"
" Key (re)Mappings "
"------------------"

" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" The default leader is '\', but many people prefer ',' as it's in a standard location
let mapleader = ','

" Fast editing of the .vimrc
map <leader>vv :e $MYVIMRC<cr>

" remap the esc key
imap jj <Esc>

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q


" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"insert one character
noremap I i<Space><Esc>r

" Underline aline with =
nnoremap <leader>1 yypVr=

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Adjust viewports to the same size
map <Leader>= <C-w>=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" clean up white space quickly
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>w :%s/\(\S\)\s\+$/\1/<cr>:let @/=''<CR>

nnoremap <D-S-LEFT> <C-w>h
nnoremap <D-S-DOWN> <C-w>j
nnoremap <D-S-UP> <C-w>k
nnoremap <D-S-RIGHT> <C-w>l

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

" tab movement
nmap <D-S-]> gt
nmap <D-S-[> gT

vmap <D-S-]> gt
vmap <D-S-[> gT

imap <D-S-]> <Esc>gt
imap <D-S-[> <Esc>gT

" movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" mapping to perform coffee compile on file or visual selection
nmap <silent> <leader>cc :CoffeeCompile<CR>
vmap <silent> <leader>cc :CoffeeCompile<CR>

" mapping to setup ack with the current file type
nmap <leader>aa :Ack --<c-r>=&filetype<cr><space>

" mapping to reset the expandtab values for a file
nmap <silent> <leader>tt :set expandtab!<cr>:retab!<cr>




"---------------------"
" Project Root Finder "
"---------------------"

" make this into a plugin someday??
" TODO: add some project type options, like spine would start in the app folder?
" TODO: incorperate into some toggles such as ACK so that ack starts at the top
" project and also knows the file type to pass in too

" set default filename for local vimrc
if !exists("g:ProjectRootFinder")
    let g:ProjectRootFinder = ['.git', 'build.xml', 'Makefile', '.project', '.lvimrc']
endif

" upwards search project file
function! FindProjectRoot()
    let currentdir = expand("%:p:h")
    let cmd = 'cd '

    for filename in g:ProjectRootFinder
        let file = findfile(filename, expand("%:p:h") . ';')
        if filereadable(file)
            let b:ProjectRootPath = fnamemodify(file, ':p:h')
            break
        else
            let dir = finddir(filename, expand("%:p:h") . ';')
            if isdirectory(dir)
                let b:ProjectRootPath = substitute(fnamemodify(dir, ':p:h'),"/".filename . "$","","")
                break
            endif
        endif
    endfor

    if exists('b:ProjectRootPath') && stridx(currentdir, b:ProjectRootPath, 0) == 0
        let cmd .= b:ProjectRootPath
    else
        let cmd .= currentdir
    endif

    execute cmd
endfunction

" move to the project root folder
nmap <silent> <leader>fp :call FindProjectRoot()<CR>:pwd<CR>
nmap <silent> <leader>fpp :call FindProjectRoot()<CR>:tabnew<CR><leader>p
nmap <silent> <leader>fpo :call FindProjectRoot()<CR>:tabnew .<CR>
nmap <silent> <leader>fpa :call FindProjectRoot()<CR>:Ack --<c-r>=&filetype<cr><space>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>



"---------------"
" Function Keys "
"---------------"

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Toggle relative line numbers
nmap <silent> <F1> :call NumberToggle()<cr>
imap <silent> <F1> <ESC>:call NumberToggle()<cr>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Automatically go to relative number when using insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Toggle normal line numbers
nmap <silent> <F2> :set nu!<CR>
imap <silent> <F2> <ESC>:set nu!<CR>

" Toggle Tagbar display
nmap <silent> <F3> :TagbarToggle<CR>
imap <silent> <F3> <ESC>:TagbarToggle<CR>




"--------------"
" GUI Settings "
"--------------"

" GVIM- (here instead of .gvimrc)
if has('gui_running')

    set guioptions-=T           " remove the toolbar
    set lines=40                " 40 lines of text instead of 24

    if has("autocmd")
        " Automatically resize splits when resizing MacVim window
        autocmd VimResized * wincmd =
    endif
endif

" Set font according to system
set gfn="Panic Sans:h12"
set shell=/bin/bash




"---------"
" Plugins "
"---------"

" solarized options {
    let g:solarized_termtrans  = 1
    let g:solarized_termcolors = 256
    let g:solarized_contrast   = "high"
    let g:solarized_visibility = "high"
" }


" Supertab {
    let g:SuperTabDefaultCompletionType = "context"
" }


" Tabularize {
    nmap <leader>t= :Tabularize /=<CR>
    vmap <leader>t= :Tabularize /=<CR>
    nmap <leader>t: :Tabularize /:<CR>
    vmap <leader>t: :Tabularize /:<CR>
    nmap <leader>t:: :Tabularize /:\zs<CR>
    vmap <leader>t:: :Tabularize /:\zs<CR>
    nmap <leader>t, :Tabularize /,<CR>
    vmap <leader>t, :Tabularize /,<CR>
    nmap <leader>t<Bar> :Tabularize /<Bar><CR>
    vmap <leader>t<Bar> :Tabularize /<Bar><CR>
" }

