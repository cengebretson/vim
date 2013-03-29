"--------------------------"
" version 2.4              "
"--------------------------"
" last changed: 03/05/2013 "
"--------------------------"

"------------------"
" General Settings "
"------------------"

" call pathogen
call pathogen#infect()

                                                " set file types
filetype plugin indent on                       " Automatically detect file types.
syntax on                                       " syntax highlighting

                                                " set initial values
set nocompatible                                " must be first line
set background=dark                             " Assume a dark background
set mouse=a                                     " automatically enable mouse usage
set autoread                                    " Set to auto read when a file is changed from the outside
set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore                         " allow for cursor beyond last character
set history=1000                                " Store a ton of history (default is 20)

" better unix / windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" Turn backup off, since most stuff is in svn/git anyway...
set nobackup
set nowb
set noswapfile




"----------"
" VIM UI   "
"----------"

color jellybeans                                " load a colorscheme

set showmode                                    " display the current mode
set showcmd                                     " show incomplete cmds down the bottom

set cursorline                                  " highlight current line
set cursorcolumn
hi cursorline guibg   = #333333
hi cursorcolumn guibg = #262626
hi colorcolumn guibg  = #592929

set backspace=indent,eol,start                  " backspace settings
set linespace=0                                 " No extra spaces between rows
set nu                                          " Line numbers on
set showmatch                                   " show matching brackets/parenthesis
set incsearch                                   " find as you type search
set hlsearch                                    " highlight search terms
set gdefault                                    " the /g flag on :s substitutions by default
set winminheight=0                              " windows can be 0 line high
set ignorecase                                  " case insensitive search
set smartcase                                   " case sensitive when uc present

set wildmenu                                    " show list instead of just completing
set wildmode=list:longest,full                  " command <Tab> completion, list matches, then longest common part, then all.
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set scrolljump=5                                " lines to scroll when cursor leaves screen
set scrolloff=3                                 " minimum lines to keep above and below cursor

set list                                        " highlight problematic whitespace
set listchars=tab:» ,trail:.,extends:#,nbsp:.

" use system clipboard for copy/paste
set clipboard=unnamed





"------------"
" Formatting "
"------------"

set nowrap                                      " wrap long lines
set textwidth=0                                 " disable text width
set whichwrap=b,s,h,l,<,>,[,]                   " backspace and cursor keys wrap to
set autoindent                                  " indent at the same level of the previous line
set shiftwidth=4                                " use indents of 4 spaces
set noexpandtab                                 " tabs are tabs, not spaces
set tabstop=4                                   " an indentation every four columns
set softtabstop=4                               " let backspace delete indent





"------------------"
" Auto Commands    "
"------------------"

" remove option that automatically inserts comment leader after hitting enter
autocmd! FileType * setlocal formatoptions-=r

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab

" javascript file type settings
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et

" Automatically go to relative number when using insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Treat JSON files like JavaScript
autocmd BufNewFile,BufRead *.json set ft=json

" Treat gradle as a groovy
autocmd BufNewFile,BufRead *.gradle set ft=groovy

" Change to directory of file that is currently in the buffer
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing white space when saving
" autocmd BufWritePre * :%s/\(\S\)\s\+$/\1/e

" remap arrow keys for iterm like tab switching
autocmd BufEnter * call RemapArrowKeysForSwitchingTabs()

" Only use highlight line/column for the active buffer window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorcolumn
    autocmd WinLeave * set nocursorcolumn
augroup END





"------------------"
" Key (re)Mappings "
"------------------"

" Disable arrow Keys
inoremap  <Up>     <ESC>
inoremap  <Down>   <ESC>
inoremap  <Left>   <ESC>
inoremap  <Right>  <ESC>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" insert space and stay in command mode
nmap <c-space> i<space><esc>

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
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

" The default leader is '\', but many people prefer ',' as it's in a standard location
let mapleader = ','

" Fast editing of the .vimrc
map <leader>ve :tabe $MYVIMRC<cr>
map <leader>vs :so $MYVIMRC<cr>

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

" draw some headlines
nnoremap <leader>h1 yypVr=o
nnoremap <leader>h2 yypVr-o

" Jump to beginning/end of the line
inoremap <c-a> <c-o>I
inoremap <c-e> <c-o>A

" clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" clean up white space quickly, TODO: impacts the camelcase word movement
nnoremap <leader>z :%s/\(\S\)\s\+$/\1/<cr>:let @/=''<CR>
nnoremap <leader>Z :%s/\s\+$//<cr>:let @/=''<CR>

" movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Ctrl-j/k mapped to move and up down screens
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" Insert just a single character
nmap <leader>i i<space><esc>hr

" mapping to setup ack with the current file type
nmap <leader>A :call FindProjectRoot()<CR>:Ack --<c-r>=&filetype<cr><space>
nmap <leader>a :lcd %:h<CR>:Ack --<c-r>=&filetype<cr><space>

" remap peepopen to first try to find the project root
nmap <silent> <c-p> :call FindProjectRoot()<CR><Plug>PeepOpen
vmap <silent> <c-p> :call FindProjectRoot()<CR><Plug>PeepOpen
imap <silent> <c-p> <esc> :call FindProjectRoot()<CR><Plug>PeepOpen

" mapping to reset the expandtab values for a file
nmap <silent> <leader>tt :setlocal softtabstop=4 tabstop=4 shiftwidth=4 expandtab!<cr>:retab!<cr>

" mapping to use a different tab setting more suitable for other languages
nmap <silent> <leader>t2 :setlocal softtabstop=2 tabstop=2 shiftwidth=2<CR>:retab!<cr>
nmap <silent> <leader>t4 :setlocal softtabstop=4 tabstop=4 shiftwidth=4<CR>:retab!<cr>

" open up the current file's directory in finder
nmap <silent> <leader>o :lcd %:h<CR>:! open .<cr><cr>
nmap <silent> <leader>O :call FindProjectRoot()<CR>:! open .<cr><cr>

" open terminals
nmap <silent> <leader>x :call OpenTerminal(expand("%:p:h"))<CR>
nmap <silent> <leader>X :call FindProjectRoot()<CR>:call OpenTerminal(getcwd())<CR>

" mapping for loading local .lvimrc file
nmap <silent> <leader>ll :call LoadLocalVimrc()<CR>

" Insert newlines
nnoremap <C-CR>   m`o<Esc>``
nnoremap <C-D-CR> m`O<Esc>``


" remapping ESC to be a toggle for insert/normal mode
nnoremap <Esc> i

" bubble single and multiple lines (uses vim-unimpaired plugin).
nmap <D-J> ]e
nmap <D-K> [e
vmap <D-J> ]egv
vmap <D-K> [egv
imap <D-J> <esc>]e
imap <D-K> <esc>[e

" map command-L and command-H to indenting or outdenting
" while keeping the original selection in visual mode
vmap <D-L> >gv
vmap <D-H> <gv
nmap <D-L> >>
nmap <D-H> <<
omap <D-L> >>
omap <D-H> <<
imap <D-L> <esc>>>i
imap <D-H> <esc><<i

" use SHIFT-ENTER to cycle through window buffers
nmap <S-CR> <C-W>w
imap <S-CR> <ESC><C-W>w

" use python to format JSON
nmap <Leader>jf :call JsonFormat(0)<CR>
vmap <Leader>jf :call JsonFormat(1)<CR>
nmap <Leader>jc :call JsonConcealToggle()<CR>



"---------------"
" Function Keys "
"---------------"

" Toggle relative line numbers
nmap <silent> <F1> :call NumberToggle()<cr>
imap <silent> <F1> <ESC>:call NumberToggle()<cr>
vmap <silent> <F1> <ESC>:call NumberToggle()<cr>

" Toggle normal line numbers
nmap <silent> <F2> :set nu!<CR>
imap <silent> <F2> <ESC>:set nu!<CR>
vmap <silent> <F2> <ESC>:set nu!<CR>

" Toggle Tagbar display
nmap <silent> <F3> :TagbarToggle<CR>
imap <silent> <F3> <ESC>:TagbarToggle<CR>
vmap <silent> <F3> :TagbarToggle<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Write file and Refresh browser and return focus to vim
nmap <silent> <F5> :call RefreshToggle()<cr>
imap <silent> <F5> <ESC>:w<CR>:call RefreshToggle()<CR>i
vmap <silent> <F5> :w<CR>:call RefreshToggle()<CR>

" Toggle Color Column display
nmap <silent> <F6> :call ColorColumnToggle()<CR>
imap <silent> <F6> <ESC>:call ColorColumnToggle()<CR>

" Toggle Syntastic Error Highlight
nmap <silent> <F7> :call Syntastic_Check()<CR>
imap <silent> <F7> <ESC>:call Syntastic_Check()<CR>



"--------------"
" GUI Settings "
"--------------"

" GVIM- (here instead of .gvimrc)
if has('gui_running')

    set guioptions-=T  " remove the toolbar
    set lines=40       " 40 lines of text instead of 24

    if has("autocmd")
        " automatically resize splits when resizing macvim window
        autocmd vimresized * wincmd =
    endif

    " control keys to switch viewports
    " - Staying with the defaults of CTRL-W + J,K,L,H to move
    " - Also have CTRL-W + W to jump buffers

endif

" Set font according to system
" set gfn=Panic\ Sans\ for\ Powerline:h12
set gfn=Source\ Code\ Pro:h12
set shell=/bin/bash






"-------------"
" Functions   "
"-------------"

" keys to switch tabs
function! RemapArrowKeysForSwitchingTabs() 
    noremap  <D-Left>  gT
    noremap  <D-Right> gt
    inoremap <D-Right> <esc>gt
    inoremap <D-Left>  <esc>gT
endfunction

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

" If the file .vimrc exists in the root of a git project - load it
function! LoadLocalVimrc()
    " first jump to project root if it exists
    call FindProjectRoot()

    " check for local lvimrc file
    let l:configFile = '.lvimrc'
    if filereadable(l:configFile)
        exec ":source " . l:configFile
    endif
endfunction

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

function! JsonConcealToggle()
    if(&conceallevel == 2)
        set conceallevel=0
    else
        set conceallevel=2
    endif
endfunc

function! JsonFormat(visual) range
    if a:visual == 1
        normal gvy
    else
        %y+
    endif
    
    vnew
    setlocal buftype=nofile
    silent put=@+
    silent %!python -m json.tool
    setlocal ft=json
    setlocal nomodifiable
endfunc

function! RefreshToggle()
    if (g:RefreshRunningBrowserReturnFocus == 0)
        echo "Refresh Browser returns focus to VIM"
        let g:RefreshRunningBrowserReturnFocus = 1
    else
        echo "Refresh Browser keeps focus on browser"
        let g:RefreshRunningBrowserReturnFocus = 0
    endif
endfunc

function! Syntastic_Check()
    let g:syntastic_mode_map['mode'] = 'passive'
    :SyntasticCheck
    :Errors
endfunc

function! ColorColumnToggle()
    if(&colorcolumn > 0)
        set colorcolumn=0
    else
        " assuming the standard 80 columns for wrapping
        set colorcolumn=80
    endif
endfunc

function! OpenTerminal(dir)
    " TODO: give option to simply bring focus to current terminal, perhaps ,tt mapping??
    " TODO: also split this up so its easier to read!
    silent :execute "!osascript -e 'tell application \"iTerm\"' -e 'activate' -e 'try' -e 'set t to the last terminal' -e 'on error' -e 'set t to (make new terminal)' -e 'end try' -e 'tell t' -e 'launch session \"Default Session\"' -e 'tell the last session' -e 'write text \"cd " . a:dir . ";clear;ls\"' -e 'end tell' -e 'end tell' -e 'end tell'"
endfunction





"---------"
" Plugins "
"---------"

" markdown plugin {
    let g:vim_markdown_folding_disabled=1
" }

" coffeescript plugin {
    let g:coffee_compile_vert = 1

    " mapping to perform coffee compile on file or visual selection
    nmap <silent> <leader>cc :CoffeeCompile<CR>
    vmap <silent> <leader>cc :CoffeeCompile<CR>
    nmap <silent> <leader>cr :CoffeeRun<CR>
    vmap <silent> <leader>cr :CoffeeRun<CR>
    nmap <silent> <leader>cl :CoffeeLint<CR>
    vmap <silent> <leader>cl :CoffeeLint<CR>
" }

" Syntastic plugin {
    let g:syntastic_javascript_checker='jshint'
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': [] }
" }

" neocomplcache plugin {
    " Launches neocomplcache automatically on vim startup.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underscore completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Sets minimum char length of syntax keyword.
    let g:neocomplcache_min_syntax_length = 3
    " buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define file-type dependent dictionaries.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword, for minor languages
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>    neocomplcache#smart_close_popup() . "\<CR>"
    " <TAB>: completion.
    inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><s-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h>   neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>   neocomplcache#close_popup()
    inoremap <expr><C-e>   neocomplcache#cancel_popup()

    " extra javascript completion
    autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS

    " make sure the popup complete box shows up after typing something (not scrolling)
    let g:neocomplcache_enable_insert_char_pre = 1
" }

" Tabularize {
    nmap <leader>t=      :Tabularize /=<CR>
    vmap <leader>t=      :Tabularize /=<CR>
    nmap <leader>t:      :Tabularize /:<CR>
    vmap <leader>t:      :Tabularize /:<CR>
    nmap <leader>t::     :Tabularize /:\zs<CR>
    vmap <leader>t::     :Tabularize /:\zs<CR>
    nmap <leader>t,      :Tabularize /,<CR>
    vmap <leader>t,      :Tabularize /,<CR>
    nmap <leader>t"      :Tabularize /"<CR>
    vmap <leader>t"      :Tabularize /"<CR>
    nmap <leader>t<Bar>  :Tabularize /<Bar><CR>
    vmap <leader>t<Bar>  :Tabularize /<Bar><CR>
" }

" Tagbar {
    let g:tagbar_sort      = 0
    let g:tagbar_compact   = 0
    let g:tagbar_autofocus = 1

    let g:tagbar_type_css = {
            \ 'ctagstype': 'css',
            \ 'kinds' : [
                    \'c:classes',
                    \'i:ids',
                    \'t:tags'
            \]
    \}

    let g:tagbar_type_stylus = {
            \ 'ctagstype': 'stylus',
            \ 'kinds' : [
                    \'c:classes',
                    \'i:ids',
                    \'t:tags'
            \]
    \}
" }

" ZenCoding {
    " Enabling Zencoding
    let g:user_zen_settings = {
                    \  'php' : {
                    \        'extends' : 'html',
                    \        'filters' : 'c',
                    \  },
                    \  'xml' : {
                    \        'extends' : 'html',
                    \  },
                    \  'haml' : {
                    \        'extends' : 'html',
                    \  },
                    \  'erb' : {
                    \        'extends' : 'html',
                    \  },
                    \  'eco' : {
                    \        'extends' : 'html',
                    \  },
                    \  'jeco' : {
                    \        'extends' : 'html',
                    \  },
                    \}

    " keep default mapping of <c-y>,
" }

" Powerline settings {
    set laststatus=2
    let g:Powerline_symbols = 'fancy'
" }

" browser refresh {
    let g:RefreshRunningBrowserReturnFocus = 0

    " write file and refresh browser with cmd-r
    nmap <silent> <d-r> :w<cr>:RRB<cr>
    imap <silent> <d-r> <esc>:w<cr>:RRB<cr>i
    vmap <silent> <d-r> :w<cr>:RRB<cr>
" }


