"--------------------------"
" version 2.6              "
"--------------------------"
" last changed: 12/31/2014 "
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

set background=dark                             " Assume a dark background
colorscheme iceberg                             " load a colorscheme

set showmode                                    " display the current mode
set showcmd                                     " show incomplete cmds down the bottom

set cursorline                                  " highlight current line
set cursorcolumn
hi cursorline guibg   = #333333
hi cursorcolumn guibg = #262626
hi colorcolumn guibg  = #592929
hi overlength guibg   = #795959

set backspace=indent,eol,start                  " backspace settings
set linespace=0                                 " No extra spaces between rows
set nu                                          " Line numbers on
set relativenumber                              " relative numbers
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
set listchars=nbsp:¬,tab:» ,trail:·,extends:#

" use system clipboard for copy/paste
set clipboard=unnamed





"------------"
" Formatting "
"------------"

set nowrap                                      " wrap long lines
set textwidth=0                                 " disable text width
set whichwrap=b,s,h,l,<,>,[,]                   " backspace and cursor keys wrap to
set autoindent                                  " indent at the same level of the previous line

"------------"
" Tabs       "
"------------"

set shiftwidth=4                                " use indents of 4 spaces
set tabstop=4                                   " an indentation every four columns
set softtabstop=2                               " let backspace delete indent
set expandtab                                   " tabs are spaces





"------------------"
" Auto Commands    "
"------------------"

" remove option that automatically inserts comment leader after hitting enter
autocmd! FileType * setlocal formatoptions-=r

" handle different file types
autocmd FileType python     setlocal sts=4 ts=4 sw=4 tw=79 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.gradle set ft=groovy

" Change to directory of file that is currently in the buffer
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing white space when saving
" autocmd BufWritePre * :%s/\(\S\)\s\+$/\1/e

" load any local .vimrc files
autocmd BufNewFile,BufRead * call LoadLocalVimrc()

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

" remap peepopen to first try to find the project root
nmap <silent> <c-p> :call FindProjectRoot()<CR><Plug>PeepOpen
vmap <silent> <c-p> :call FindProjectRoot()<CR><Plug>PeepOpen
imap <silent> <c-p> <esc> :call FindProjectRoot()<CR><Plug>PeepOpen

" toggle tagbar
nmap <silent> <c-b> :TagbarToggle<CR>
vmap <silent> <c-b> :TagbarToggle<CR>
imap <silent> <c-b> <esc> :TagbarToggle<CR>

" mapping to reset the expandtab values for a file
nmap <silent> <leader>tt :call TabToggle()<cr>

" mapping to use a different tab setting more suitable for other languages
nmap <silent> <leader>t2 :setlocal softtabstop=2 tabstop=2 shiftwidth=2<CR>:call NiceRetab()<cr>
nmap <silent> <leader>t4 :setlocal softtabstop=4 tabstop=4 shiftwidth=4<CR>:call NiceRetab()<cr>

" open up the current file's directory in finder
nmap <silent> <leader>o :lcd %:h<CR>:! open .<cr><cr>
nmap <silent> <leader>O :call FindProjectRoot()<CR>:! open .<cr><cr>

" open terminals
nmap <silent> <leader>x :call OpenTerminal(expand("%:p:h"))<CR>
nmap <silent> <leader>X :call FindProjectRoot()<CR>:call OpenTerminal(getcwd())<CR>

" Insert newlines
nmap <D-k> m`O<Esc>``
nmap <D-j> m`o<Esc>``
imap <D-k> <Esc>m`O<Esc>``l<Esc>
imap <D-j> <Esc>m`o<Esc>``l<Esc>

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

" toggle numbers
nmap <silent> <leader>nn :call NumberToggle()<CR>
vmap <silent> <leader>nn :call NumberToggle()<CR>

" git history
nmap <silent> <leader>gh :Shell git log -u -5 %<CR>
vmap <silent> <leader>gh :Shell git log -u -5 %<CR>

" git blame
nmap <silent> <leader>gb :Gblame<CR>
vmap <silent> <leader>gb :Gblame<CR>


"---------------"
" Function Keys "
"---------------"

" Toggle Color Column display
nmap <silent> <F1> :call Column80Toggle()<CR>
imap <silent> <F1> <ESC>:call Column80Toggle()<CR>

" Toggle colorscheme mode
nmap <silent> <F2> :call SolarizedToggle()<CR>
imap <silent> <F2> <ESC>:call SolarizedToggle()<CR>




"--------------"
" GUI Settings "
"--------------"

" GVIM- (here instead of .gvimrc)
if has('gui_running')

    set guioptions-=T  " remove the toolbar
    set lines=40       " 40 lines of text instead of 24

    " automatically resize splits when resizing macvim window
    autocmd vimresized * wincmd =

    " control keys to switch viewports
    " - Staying with the defaults of CTRL-W + J,K,L,H to move
    " - Also have CTRL-W + W to jump buffers

endif

" Set font according to system
set gfn=Input:h12
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

" set array of files that are found at root of project
if !exists("g:ProjectRootFinder")
    let g:ProjectRootFinder = ['.git', 'build.xml', 'Makefile', '.project']
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

let g:number_is_active = 2

function! NumberToggle()
    if (g:number_is_active == 0)
        set number
        let g:number_is_active = 1
    elseif (g:number_is_active == 1)
        set relativenumber
        let g:number_is_active = 2
    else
        set nonumber
        set norelativenumber
        let g:number_is_active = 0
    endif
endfunc

if !exists("g:solarized_is_active")
    let g:solarized_is_active = 0
    let g:solarized_previous_bg = &background
    redir => output
    silent colorscheme
    redir END
    let g:solarized_previous_color = substitute(output, "\n", "", "")
endif

function! SolarizedToggle()
    if (g:solarized_is_active == 1)
        exec 'set bg=' . g:solarized_previous_bg
        exec 'colorscheme ' . g:solarized_previous_color
        let g:solarized_is_active = 0
        set gfn=Input:h12
        AirlineRefresh
    else
        set bg=light
        colorscheme solarized
        let g:solarized_is_active = 1
        set gfn=Input\ Bold:h12
        AirlineRefresh
    endif
endfunc

function! Column80Toggle()
    if(&colorcolumn > 0)
        set colorcolumn=0
        match none overlength
    else
        " assuming the standard 80 columns for wrapping
        set colorcolumn=80
        match overlength /\%81v.*/
    endif
endfunc

function! OpenTerminal(dir)
    " TODO: give option to simply bring focus to current terminal, perhaps ,tt mapping??
    " TODO: also split this up so its easier to read!
    silent :execute "!osascript -e 'tell application \"iTerm\"' -e 'activate' -e 'try' -e 'set t to the last terminal' -e 'on error' -e 'set t to (make new terminal)' -e 'end try' -e 'tell t' -e 'launch session \"Default Session\"' -e 'tell the last session' -e 'write text \"cd " . a:dir . ";clear;ls\"' -e 'end tell' -e 'end tell' -e 'end tell'"
endfunction

" plugin/stringify.vim
" Author: 29decibel
" make raw contents string
function! Stringify() range
  for linenum in range(a:firstline, a:lastline)
    let replaceSub = "'\\1'\ +"
    if a:lastline == linenum
      let replaceSub = "'\\1'"
    endif
    let newline = getline(linenum)
    " escape single quote
    " \\\\ is \
    " \= means previous char is optional
    let newline = substitute(newline, "\\\\\\='", "\\\\\\\'", 'g')
    " add single quotes and plus
    let newline = substitute(newline,'\(\S.*\)', replaceSub ,'g')
    call setline(linenum, newline)
  endfor
endfunction

"------------------ "
" Load local config "
"------------------ "

function! LoadLocalVimrc()
    " return if this is a nonmodifiable window
    if (&modifiable == 1)

        " first jump to project root if it exists
        call FindProjectRoot()

        " check for local .lvimrc file
        let l:configFile = '.vimrc.local'
        if filereadable(l:configFile)
            exec ":source " . l:configFile
        endif
    endif
endfunction

"-----------------"
" Refresh Browser "
"-----------------"

" taken from https://github.com/mkitt/browser-refresh.vim

function! RefreshRunningBrowser()
  " TODO: at somepoint have something to open current file in browser??
  silent :!ps -xc|grep -sq Chrome && osascript -e 'tell app "Google Chrome"' -e 'activate' -e 'tell app "System Events" to keystroke "r" using {command down}' -e 'end tell'
  redraw!
  if ((g:RefreshRunningBrowserReturnFocus == 1) && has('gui_macvim'))
    silent :!ps -xc|grep -sq MacVim && osascript -e 'tell app "MacVim"' -e 'activate' -e 'end tell'
  endif
endfunction

command! RRB :call RefreshRunningBrowser()





"---------------"
" Fun with Tabs "
"---------------"

function! TabToggle()
    let l:winview = winsaveview()
    if (&expandtab > 0)
        Space2Tab
    else
        Tab2Space
    endif
    set expandtab!
    call winrestview(l:winview)
endfunc

function! NiceRetab()
    let l:winview = winsaveview()
    if (&expandtab == 0)
        Space2Tab
    else
        Tab2Space
    endif
    call winrestview(l:winview)
endfunc

" This is a quick hack to make it possible to use tabs at the beginning of a
" line but then use spaces after any non whitespace character for alignment.
" Borrowed some code from Michael Geddes's Intelligent Indent plugin.
function! TryingToBeSmarterTab()
    if pumvisible()
        return "\<C-n>"
    elseif (&expandtab == 1)
        return "\<TAB>"
    elseif strpart(getline('.'),0,col('.')-1) =~'^\s*$'
        return "\<TAB>"
    else
        let sts=(&sts==0) ? &sw : &sts
        let sp=(virtcol('.') % sts)
        if sp==0 | let sp=sts | endif
        return strpart("                  ",0,1+sts-sp)
    endif
endfunc

" ------------------------------ "
" Shell commands into new buffer "
" ------------------------------ "

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" ---------------- "
" full screen mode "
" ---------------- "

let s:InFullScreenMode = 0

function! ToggleFullscreen()
    if s:InFullScreenMode == 1
        exe "set nofu"
        let s:InFullScreenMode = 0
    else
        exe "set fu"
        exe "set columns=128"
        exe "set lines=128"
        let s:InFullScreenMode = 1
    endif
endfunction

command! ToggleFullscreen call ToggleFullscreen()
nmap <leader>fs :ToggleFullscreen<cr>



" Retabbing setup to work only at the beginning of the line, leaving spaces used for alignment alone.

command! -range=% -nargs=0 Tab2Space exec "silent! <line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t',repeat(' ', ".&ts."), 'g')"
command! -range=% -nargs=0 Space2Tab exec "silent! <line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}','\\t', 'g')"




"---------"
" Plugins "
"---------"

" Limelight plugin {
    let g:limelight_is_active = 0

    function! LimelightToggle()
        if (g:limelight_is_active == 1)
            Limelight!
            set cursorline
            set cursorcolumn
            let g:limelight_is_active = 0
        else
            Limelight
            set cursorline!
            set cursorcolumn!
            let g:limelight_is_active = 1
        endif
    endfunc

    nmap <silent> <leader>ll :call LimelightToggle()<CR>
    vmap <silent> <leader>ll :call LimelightToggle()<CR>
" }

" Goyo plugin {
    function! GoyoToggle()
        Goyo
    endfunc

    function! s:goyo_enter()
      set noshowmode
      set noshowcmd
      set scrolloff=999
      set guifont=Input:h14
      if g:limelight_is_active == 0
          call LimelightToggle()
      endif
      call ToggleFullscreen()
    endfunction

    function! s:goyo_leave()
      set showmode
      set showcmd
      set scrolloff=3
      set guifont=Input:h12
      if g:limelight_is_active == 1
          call LimelightToggle()
      endif
      call ToggleFullscreen()
    endfunction

    autocmd! User GoyoEnter
    autocmd! User GoyoLeave
    autocmd  User GoyoEnter nested call <SID>goyo_enter()
    autocmd  User GoyoLeave nested call <SID>goyo_leave()

    nmap <silent> <leader>gy :call GoyoToggle()<CR>
    vmap <silent> <leader>gy :call GoyoToggle()<CR>
" }

" coffeescript plugin {
    " make sure to run sudo ln -s /usr/local/bin/coffee /usr/bin/coffee
    " make sure to run sudo ln -s /usr/local/bin/node /usr/bin/node
    " so that the correct binaries are available
    let g:coffee_compile_vert = 1
    let g:coffee_compiler = '/usr/local/bin/coffee'
    " mapping to perform coffee compile on file or visual selection
    nmap <silent> <leader>cc :CoffeeCompile<CR>
    vmap <silent> <leader>cc :CoffeeCompile<CR>
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

    let g:tagbar_type_groovy = {
        \ 'ctagstype' : 'groovy',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'c:class',
            \ 'i:interface',
            \ 'f:function',
            \ 'v:variables',
        \ ]
    \ }

    let g:tagbar_type_stylus = {
        \ 'ctagstype': 'stylus',
        \ 'kinds' : [
                \'c:classes',
                \'i:ids',
                \'t:tags'
        \]
    \}
" }

" airline settings {
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline_inactive_collapse = 1
    let g:airline#extensions#tagbar#enabled = 0
" }

" browser refresh {
    let g:RefreshRunningBrowserReturnFocus = 0
    " write file and refresh browser with cmd-r
    nmap <silent> <d-r> :w<cr>:RRB<cr>
    imap <silent> <d-r> <esc>:w<cr>:RRB<cr>i
    vmap <silent> <d-r> :w<cr>:RRB<cr>
" }

" Tern Plugin {
    let g:tern_map_keys=1
    let g:tern_show_argument_hints='on_hold'
" }

" Ultisnip {
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }

" YouCompleteMe {
    " since youcompleteme steals the tabs we need to remap them
    au BufEnter * exec "inoremap <expr><TAB> TryingToBeSmarterTab()"
    au BufEnter * exec "inoremap <expr><s-TAB> pumvisible() ? \"\<C-p>\" : \"\<s-TAB>\""
" }

" Easy Motion {
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Bi-directional find motion
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    " nmap s <Plug>(easymotion-s)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-s2)

    " Turn on case sensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

    " Gif config
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)

    " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    " Without these mappings, `n` & `N` works fine. (These mappings just provide
    " different highlight method and have some other features )
    " map  n <Plug>(easymotion-next)
    " map  N <Plug>(easymotion-prev)

    " better enter key mapping
    let g:EasyMotion_enter_jump_first = 1
" }

" Fugitive {

" }

" Wildfire {
    let g:wildfire_objects = {
        \ "*" : ["i'", 'i"', "i)", "i]", "i}", "ip"],
        \ "html,xml" : ["at"]
    \ }
" }

" Ag Helpers {
    " in quickfix window...
    " e    to open file and close the quickfix window
    " o    to open (same as enter)
    " go   to preview file (open but maintain focus on ag.vim results)
    " t    to open in new tab
    " T    to open in new tab silently
    " h    to open in horizontal split
    " H    to open in horizontal split silently
    " v    to open in vertical split
    " gv   to open in vertical split silently
    " q    to close the quickfix window"
" }

" Zen Coding {
    " keep default mapping of <c-y>,
" }

