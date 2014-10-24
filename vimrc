" Official: http://github.com/lsd/vim
" Updated: 06/21/2014
"          * Added vim-go (Go lang)
"
" What:  Boilerplate GUI and shell vim rc.
"          For developers, sysadmins, and
"          any user who chooses vim as
"          their tool to write prose or
"          keeping notes.
"
"               This is WIP. Before using, you may want to
"          turn off the automatic behavior that occurs
"          when any file is written. This is done by
"          commenting call to the OnWriteOverride
"          function. The behavior (trimming whitespace, ff
"          to unix, etc) is around line 465

" Features: Uses NeoBundle package
"           Autowrite when focus losed
"           Auto trim whitespace on write
"           Comes with themes including solarized,
"           zenburn and monokai.
"           Tab enters 2+ spaces instead of TAB key ^T
"           Uses Fixed width Powerline Fonts
"           ... TODO

" Caveats: Make sure your $PATH is correct within vim. View it using :!echo $PATH
"          If not correct, try putting your PATHs in /etc/paths. Mine looks
"          like this:
"          ~/.rbenv/shims
             " /Applications/MAMP/bin/php/current/bin
             " /Library/Frameworks/Python.framework/Versions/3.3/bin
             " /usr/local/share/npm/bin
             " /usr/local/bin
             " /usr/bin
             " /usr/local/sbin
             " /usr/sbin
             " /sbin
             " /bin
             " ~/bin
             " Its important to have /u/l/b before /u/b else the non-exuberant ctags is picked up and
             " gives an error: 'illegal option -R'

" Help: <Leader>h and <Leader>hh in INSERT mode. <ESC>\h<CR> opens cheatsheet

" Getting there. Tested on MacVim but should be agnostic
" By default, backups go in ~/.vim/backups & ~/.vim/tmp
" This vimrc maps most function (F1, ... F19) keys, use/edit as needed
"   to disable this, set $VIM_NOBACKUPS == "true"
" Keymaps don't always register?
" Low timeoutlen=NEED TO HIT KEY MAPS FAST to register
" Change [t]timeoutlen length (256) to

function! SettingsGeneral()
  set mat=5
  set nolist
  set mouse=a
  set vb t_vb=
  set t_Co=256
  set gdefault
  set showmode
  set incsearch
  set cursorline
  "set ignorecase
  set copyindent
  set textwidth=0
  set wrapmargin=0
  set history=2000
  set cmdheight=2
  set scrolloff=4
  set showbreak=↪
  set hidden

  highlight FoldColumn guibg=grey guifg=blue
  highlight Folded ctermfg=11 ctermbg=8 guibg=#444444 guifg=#cccccc
  highlight SpecialKey guifg=#073642 guibg=NONE ctermbg=NONE ctermfg=241

  if $VIM_NOBACKUPS == "true"
    echo "\nNOTICE: Backups Disabled. See VIM_NOBACKUPS in ~/.vimrc\n"
    set nobackup
    set nowritebackup
  else
    set backup
    set backupdir=~/.vim/backups
    set directory=~/.vim/tmp
  endif
endfunction

function! SettingsDeveloper()
  " see note above
  set timeoutlen=265
  set ttimeoutlen=100

  set smartindent
  set showmatch
  set smartcase
  set expandtab
  set nocompatible
  set fillchars=stl:~,stlnc:-,vert:\|,fold:-,diff:-
  set number
  set nowrap
  set foldlevel=1
  set nofoldenable
  set foldnestmax=6
  set foldminlines=4
  set virtualedit=all
  set formatoptions+=1

  set foldmethod=syntax
  set complete-=k complete+=k
  set backspace=indent,eol,start
  set tabstop=2 shiftwidth=2 softtabstop=2
  set tags=./tags,tags
  set list listchars=trail:·
  set verbose=0
endfunction

function! PluginManagement()
  " DONT set this in .gvimrc
  filetype off

  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  NeoBundle 'Shougo/vimproc', { 'build' : { 'mac' : 'make -f make_mac.mak' }, }
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'kien/ctrlp.vim.git'
  NeoBundle 'lsdr/monokai'
  NeoBundle 'tpope/vim-rake'
  NeoBundle 'jeetsukumaran/vim-buffergator'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'vim-scripts/vim-mou'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'vim-scripts/dbext.vim'
  NeoBundle 'vim-scripts/mru.vim'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'jistr/vim-nerdtree-tabs'
  NeoBundle 'rodjek/vim-puppet'
  NeoBundle 'fatih/vim-go'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'sophacles/vim-processing'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'vim-scripts/applescript.vim'
  NeoBundle 'rcyrus/snipmate-snippets-rubymotion'
  NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
  "NeoBundle 'https://github.com/bling/vim-airline' " TODO replace powerline with this

  " Internalize these
  " \cu uncomment
  " \ci comment lines individually //..
  " \cm comment block /* */..
  " \cs comment pretty (?)
  " \cl or \cb comments aligned to left/BOL
  " \cA add comment at end of line
  " \c<space> toggle comment state
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-characterize'
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'juvenn/mustache.vim'
  NeoBundle 'vim-scripts/showMarks'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'vim-scripts/Txtfmt-The-Vim-Highlighter'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'tilljoel/vim-automatic-ctags'
  "NeoBundle 'majutsushi/tagbar'
  NeoBundle 'tpope/vim-unimpaired'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-bundler'
  NeoBundle 'tpope/vim-haml'
  NeoBundle 'Gundo'
  NeoBundle 'L9'
  NeoBundle 'plasticboy/vim-markdown'

  filetype plugin indent on
  if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
          \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Execute ":NeoBundleInstall"'
  endif
endfunction

function! SetAutoCommands()
  " Empty autocommands to avoid duplicate autocmd on :source %
  autocmd!

  " Autosave all bufs on blur, ignore warnings
  au FocusLost * silent! wa

  " Trim trailing whitespace
  au FocusLost * silent! wa

  " Change to current file's working dir
  au BufEnter * silent! lcd %:p:h

  " auto spellcheck git commits
  au FileType gitcommit setlocal spell

  " Universal Go style (gofmt) default is real tabs ts 8
  au BufRead,BufNewFile *.go setlocal nolist noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

  au BufRead,BufNewFile *.rb set tags+=~/.vim/tags/ruby2.0.0.tags
  au BufRead,BufNewFile *.py set tags+=~/.vim/tags/python3.3.tags
  au BufRead,BufNewFile *.json set ft=javascript
  au BufRead,BufNewFile *.twig set ft=php
  au BufRead,BufNewFile composer.lock set ft=javascript
  au BufRead,BufNewFile *.as set ft=actionscript
  au BufRead,BufNewFile *.md set ft=markdown
  au BufRead,BufNewFile *.mkd set ft=markdown
  au BufRead,BufNewFile *.markdown set ft=markdown

  " SPECIFIC: PHP (PSR-2 compliance: EOF needs newline, indent is 4 space tab, { on newline)
  au BufRead,BufNewFile *.php,*.phps,*.phtml set tabstop=4 shiftwidth=4 softtabstop=4
  au BufRead,BufNewFile *.php set tags+=~/.vim/tags/php5.4.10.tags

  call OnWriteOverride()
endfunction

function! SetFnKeyMaps()
  set pastetoggle=<F2>
  nnoremap <F2> :set invpaste paste?<CR>
  nnoremap <F3> :MRU<CR>
  nnoremap <F4> :buffers<CR>:buffer<Space>
  nnoremap <F5> :set wrap!<CR>
  "nnoremap <F6> :TagbarToggle<CR>
  nnoremap <F7> :TidyMe<CR>
"  call togglebg#map("<F8>")
  nnoremap <F9> :GundoToggle<CR>
  nnoremap <F10> :NeoBundleInstall<CR>
  nnoremap <F11> <ESC>:set hlsearch!<CR>/\s<CR><ESC>
  nnoremap <F12> :so ~/.vimrc<CR>:echo "** reloaded .vimrc\n"<CR>

  " Drag Current Line Vertically
  nnoremap <C-j> :m+<CR>
  nnoremap <C-k> :m-2<CR>
  inoremap <C-j> <Esc>:m+<CR>
  inoremap <C-k> <Esc>:m-2<CR>
  vnoremap <C-j> :m'>+<CR>gv

  " TODO choose proper comment based on filetype. allow block comments, etc. NERD Commenter?
  map <C-c> I# <Esc>$<CR><Esc>
  nnoremap q :echo 'q recording disabled'<CR>
  nnoremap qq :echo 'qq recording disabled. Did you mean ``?'<CR>

  if (&ft=='help')
    "map <buffer> q :q<CR>
  endif

endfunction

function! SetLeaderMaps()
  " Change all [TAB] to 2 [SPACE]s
  nnoremap \tc :%s:	:  :<CR><ESC>
  " Change ALL whitespace to single [SPACE]
  nnoremap \tcc :%s:\s\+: :<CR><ESC>
  nnoremap \tl :set hlsearch!<CR><ESC>
  nnoremap \ts :set spell!<CR>

  nnoremap \rf :call RunMe()<CR>
  nnoremap \lf :call LintMe()<CR>

  "nnoremap \tg :TagbarOpenAutoClose<CR><ESC>
  nnoremap \tm :ShowMarksToggle<CR>
  nnoremap \vs :VimShellPop<CR>
  nnoremap \mk :MouOpen<CR>

  noremap \em :Emodel
  noremap \ev :Eview
  noremap \ec :Econtroller
  noremap \es :Espec
  noremap \ej :Ejavascript
  noremap \et :Etask
endfunction

function! MappingHelper()
  let g:FnKeyMappings="\n
  \ F1: Toggle Left Side Bar\n
  \ F2: Toggle Paste Mode\n
  \ F3: Display Recent Files\n
  \ F4: Display and Jump to Buffer\n
  \ F5: Toggle Word Wrap\n
  \ F6: Toggle Right Side Tag Bar\n
  \ F7: Tidy current file\n
  \ F8: Toggle Dark/Light BG (solarized plugin)\n
  \ F9: Toggle Gundo Undo Tree\n
  \ F10: exec NeoBundInstall\n
  \ F11: Show all whitespace\n
  \ F12: SourceVimRC\n"

  let g:leaderMappings="\nList of Leader Key Mappings (\\)\n
  \ --------------------------\n
  \ <Leader>tc : Fix all ^I, ^M chars in buffer\n
  \ <Leader>tcc: Change all whitespace to 1 space\n
  \ <Leader>tl : Toggle search Highlight\n
  \ <Leader>tg : Toggle Tagbar Autoclose\n
  \ <Leader>ts : Toggle spellcheck\n
  \ <Leader>tm : Toggle Show Line Marks\n
  \ <Leader>mk : Open current buffer in Mou\n\n
  \ <Leader>h : List Fn key maps\n\n
  \ <Leader>hh : List Leader key maps\n\n
  \ Plugin rails.vim\n
  \ --------------------------\n
  \ <Leader>em : Emodel (rails.vim)\n
  \ <Leader>ev : Eview\n
  \ <Leader>ec : Econtroller\n
  \ <Leader>es : Espec\n
  \ <Leader>ej : Ejavascript\n
  \ <Leader>et : Etask\n\n"

  noremap \h :echo g:FnKeyMappings<CR>
  noremap \hh :echo g:leaderMappings<CR>
endfunction!

function! LittlePinPrick()
  " INJECTIONS ([t]timeoutlen LOW, so hit keys fast :h map-overview)
  " TODO OPTIMIZE XXX should only be enabled per filetype

  inoremap {      {}<LEFT>
  inoremap {}     {}
  inoremap {{     {
  inoremap {<CR>  {<CR>}<ESC>O<Space><Space>
  inoremap <silent> }   }<ESC>

  inoremap <?     <?php <ESC><CR><CR>i
  inoremap <??    <?php echo  ?><LEFT><LEFT><LEFT>
  inoremap <?!    <?php die('<pre>' . var_dump(Array()) . '</pre>') ?><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

  inoremap <xml   <?xml version="1.0" encoding="UTF-8" ?><ESC><CR>i

  inoremap <%     <%  %><LEFT><LEFT><LEFT>
  inoremap <%%    <%=  %><LEFT><LEFT><LEFT>

  inoremap ccl    console.log();<LEFT><LEFT>
  inoremap cc'    console.log('');<LEFT><LEFT><LEFT>
  inoremap cc"    console.log("");<LEFT><LEFT><LEFT>

  inoremap brp binding.remote_pry

  inoremap <C-CR> <SPACE><SPACE><CR>
endfunction

function! TidyMe()
  echo 'PENDING: TODO Implement TidyMe() in ~/.vimrc'
endfunction

function! RunMe()
  if (&ft=='php')
    !php %
  endif
  if (&ft=='javascript')
    !node %
  endif
endfunction

function! LintMe()
  if (&ft=='rb')
    !ruby -c %<CR>
  elseif (&ft=='js' || &ft=='javascript' || &ft=='json')
    !gjslint %
  elseif (&ft=='html' || &ft=='htm')
    !echo -e "\t\tneed html `&ft` lint support in ~/.vimrc"
  elseif (&ft=='php')
    !php -l %
  elseif (&ft=='haml')
    !haml -c %
  elseif (&ft=='vim')
    echo "pending: implement vimL lint"
  else
    echo "No known lint available for this filetype. see ':set ft'"
  endif
endfunction

function! SettingsPlugins()
  nnoremap <silent> <C-t> :CtrlP<CR>

  " Move bwt buffers
  nnoremap <C-h> :bp<CR>
  inoremap <C-h> <ESC>:bp<CR>
  nnoremap <C-l> :bn<CR>
  inoremap <C-l> <ESC>:bn<CR>
  "nnoremap <silent> <C-k> :bn<CR>
  "nnoremap <silent> <C-j> :bp<CR>

  " Move Lineelection UP/DOWN
  nnoremap <C-k> :m+<CR>
  inoremap <C-k> <Esc>:m+<CR>
  "vnoremap <C-k> :m'>+<CR>gv

  " DOWN
  nnoremap <C-j> :m-2<CR>
  inoremap <C-j> <Esc>:m-2<CR>
  "vnoremap <C-j> :m'<-2<CR>gv

  " PLUGIN SETTINGS
  let g:MRU_Max_Entries=50
  let g:MRU_Max_Menu_Entries=20
  let g:MRU_Window_Open_Always=1

  let g:ScreenImpl = 'Tmux'

  set wildignore+=*.o,*.obj,.git,.svn,vendor/rails/**,tmp/**,publicystem/**
  let g:CommandTMaxCachedDirectories=10
  let g:CommandTMaxHeight=20

  let g:showmarks_enable = 0

  let g:vim_markdown_folding_disabled=0
  let g:Powerline_symbols = 'fancy'

  "let g:tagbar_width = 20
  "let g:tagbar_phpctags_memory_limit = '512MB'
  let g:Tlist_Exit_OnlyWindow = 1
  let g:Tlist_Show_One_File = 1
  let g:Tlist_Enable_Fold_Column = 1
  let g:Tlist_Process_File_Always = 1
  let g:Tlist_Show_Menu = 1
  let g:Tlist_Sort_Type = "order"
  let g:Tlist_Use_Right_Window = 1
  let g:Tlist_Compact_Format = 1

  colorscheme solarized
  set bg=light

  if has("gui_running")
    set lines=65
    set columns=160

    autocmd VimEnter * call LeftSidebarToggle()
    nnoremap <F1> :call LeftSidebarToggle()<CR>

    map <Leader>n :NERDTreeCWD<CR>

    map <Leader>] :bn<CR>
    map <Leader>[ :bp<CR>
    map <Leader>} :blast<CR>
    map <Leader>{ :bfirst<CR>

    " Remove Tool+scroll bars
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    "set guifont=Source\ Code\ Pro\ ExtraLight\ for\ Powerline:h14
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h14
    set guifont=Sauce\ Code\ Powerline:h14

  else
    " colorscheme darkburn
    nnoremap <F1> :NERDTreeTabsToggle<CR>
  endif
endfunction

function! OnWriteOverride()
  " autocmd!
  au FocusLost * :%s/\s\+$//ge
  au FocusLost * :set ff=unix
endfunction

function! Vinitialize()
  call SettingsGeneral()
  call SettingsDeveloper()
  " CAVEAT: This removes all current autocmds
  call PluginManagement()
  call SettingsPlugins()
  call SetAutoCommands()
  call SetFnKeyMaps()
  call SetLeaderMaps()
  call MappingHelper()
  call LittlePinPrick()
  syntax on
endfunction

call Vinitialize()
