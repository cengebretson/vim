


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









"----------"
"  VIM UI  "
"----------"

color jellybeans               " load a colorscheme

set showmode                   " display the current mode
set showcmd                    " show incomplete cmds down the bottom

set cursorline                 " highlight current line
hi cursorline guibg=#333333    " highlight bg color of current line

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
set listchars=tab:» ,trail:.,extends:#,nbsp:.

" Autocommand to reload the status vim plugin for color changes
autocmd! ColorScheme *  source ~/.vim/bundle/statusline/plugin/statusline.vim








"------------"
" Formatting "
"------------"

set nowrap                    " wrap long lines
set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
set autoindent                " indent at the same level of the previous line
set shiftwidth=4              " use indents of 4 spaces
set expandtab                 " tabs are spaces, not tabs
set tabstop=4                 " an indentation every four columns
set softtabstop=4             " let backspace delete indent

" Remove trailing whitespaces and ^M chars
autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" remove option that automatically inserts comment leader after hitting enter
autocmd! FileType * setlocal formatoptions-=r

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79




"------------------"
" Key (re)Mappings "
"------------------"

" The default leader is '\', but many people prefer ',' as it's in a standard location
let mapleader = ','

" Fast editing of the .vimrc
map <leader>e :e $MYVIMRC<cr>

" remap the esc key
map! jj <Esc>

" Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Adjust viewports to the same size
map <Leader>= <C-w>=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>vsp :ev %%
map <leader>et :tabe %%

" Swap two words
silent <nmap> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>


if has("gui_macvim")

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

else

    " Map command-[ and command-] to indenting or outdenting
    " while keeping the original selection in visual mode
    vmap <A-]> >gv
    vmap <A-[> <gv

    nmap <A-]> >>
    nmap <A-[> <<

    omap <A-]> >>
    omap <A-[> <<

    imap <A-]> <Esc>>>i
    imap <A-[> <Esc><<i

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif


"--------------"
" GUI Settings "
"--------------"

" GVIM- (here instead of .gvimrc)
if has('gui_running')

    set guioptions-=T          	" remove the toolbar
    set lines=40               	" 40 lines of text instead of 24

    if has("autocmd")
	" Automatically resize splits when resizing MacVim window
    	autocmd VimResized * wincmd =
    endif


else
    set term=builtin_ansi       " Make arrow and other keys work
endif



" Set font according to system
if has('mac')
    set gfn=Inconsolata:h14
    set shell=/bin/bash
elseif has('win32') || has('win64')
    set gfn=Consolas:h10
else
    set gfn=Monospace\ 10
    set shell=/bin/bash
endif








"---------"
" Plugins "
"---------"

" solarized options {
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
" }


" Supertab {
    let g:SuperTabDefaultCompletionType = "context"
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

