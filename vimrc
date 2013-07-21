" vimrc web dev : http://github.com/lsd/vim
" Updated 06/02/2013

" Tested on MacVim but should be vim/OS agnostic
" Note: Extraneous buffers enabled in MacVim (not console)
" Note: cfg maps most function (F1, ..) keys, use/edit as needed
" FIXME: console vim is sometimes sluggish

set t_Co=256
set nocompatible
set smartindent
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set backspace=indent,eol,start
set history=1000
set nowrap
set number
set copyindent
set ignorecase
set smartcase
set showmatch
set showbreak=↪
set showmode
set cursorline
set cmdheight=2
set mat=5
set scrolloff=4
set virtualedit=all
set timeoutlen=200
set mouse=a
set nolist
set gdefault
set vb t_vb=

"set hlsearch " use \tl to toggle
set incsearch
set formatoptions+=1
set foldminlines=4

" Does this belong here or in the TOGGLE below?
set pastetoggle=<F2>
set complete-=k complete+=k

" TODO make sure gem-ctags is being used
set tags=./.tags;./tags;./

set nofoldenable
set foldmethod=syntax
set foldnestmax=6
set foldlevel=1
set fillchars=

highlight FoldColumn guibg=grey guifg=blue
highlight Folded ctermfg=11 ctermbg=8 guibg=#444444 guifg=#cccccc

" Most Recently Used
let g:MRU_Max_Entries=50
let g:MRU_Max_Menu_Entries=20
let g:MRU_Window_Open_Always=1

" CommandT (lags on big projects)
set wildignore+=*.o,*.obj,.git,.svn,vendor/rails/**,tmp/**,public/system/**
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxHeight=20

if $VIM_NOBACKUPS == "true"
  echo "\nNOTICE: vim backups temporarily disabled. (VIM_NOBACKUPS == true)"
  echo "_________________________________________________________________"
  set nobackup
  set nowritebackup
else
  set backup
  set backupdir=~/.vim/backups
  set directory=~/.vim/tmp
endif

let g:ScreenImpl = 'Tmux'

" NeoBundle pkg manager (DO NOT set this in .gvimrc)
filetype off " REQUIRED
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" After install, exec ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'honza/writer.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rake'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'tilljoel/vim-automatic-ctags'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'vim-scripts/R-MacOSX'
NeoBundle 'vim-scripts/vim-mou'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'vim-scripts/Txtfmt-The-Vim-Highlighter'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ervandew/screen'
NeoBundle 'L9'
NeoBundle 'Gundo'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'nathanaelkane/vim-indent-guides'
" Non-github
NeoBundle 'git://git.wincent.com/command-t.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'

filetype plugin indent on
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Execute ":NeoBundleInstall"'
endif

let showmarks_enable = 0

let g:vim_markdown_folding_disabled=0
let g:Powerline_symbols = 'fancy'

let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Show_Menu = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 5

" [FT] Set .md to Markdown and .as to Actionscript files
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.as set ft=actionscript

" auto spellcheck git commits
autocmd FileType gitcommit setlocal spell

set list listchars=trail:·
highlight SpecialKey guifg=#073642 guibg=NONE ctermbg=NONE ctermfg=241

set background=dark
colorscheme solarized
syntax on

" Autosave all bufs, ignore warnings
au FocusLost * silent! wa

if has("gui_running")
  set bg=light
  set lines=65
  set columns=160

  " split viewport horizontally new split on top
  " github.com/jeetsukumaran/vim-buffergator/blob/master/doc/buffergator.txt
  let g:buffergator_viewport_split_policy = "b"
  let g:buffergator_suppress_keymaps = 0
  let g:buffergator_autodismiss_on_select = 1
  let g:buffergator_autoupdate = 1
  let g:buffergator_display_regime = 'basename'
  let g:buffergator_split_size = 15

  " http://mg.pov.lt/vim/doc/NERD_tree.txt
  let NERDTreeIgnore = ['\.swp$', '\.DS_Store$','\.git$','\.vim$', '\~$', 'tags', 'Thumbs.db']
  let NERDTreeMouseMode = 1
  let NERDTreeShowLineNumbers = 0
  let NERDTreeChDirMode = 2

  let g:NERDTreeShowHidden = 1
  let g:NERDTreeWinSize = 45
  let g:nerdtree_tabs_meaningful_tab_names = 1
  let g:nerdtree_tabs_autoclose = 0
  let g:nerdtree_tabs_synchronize_view = 0
  let g:nerdtree_tabs_open_on_console_startup = 1
  let g:nerdtree_tabs_open_on_gui_startup = 1
  let g:nerdtree_tabs_no_startup_for_diff = 1
  let g:nerdtree_tabs_smart_startup_focus = 1

  autocmd VimEnter <buffer=1> hi ColorColumn guibg=#333333

"  autocmd VimEnter * NERDTreeTabsToggle
"  autocmd VimEnter * wincmd c
"  autocmd VimEnter * BuffergatorToggle
"  autocmd VimEnter * wincmd b

  " Toggle left sidebar http://justmao.name/life/integrate-nerdtree-and-buffergator/
  fu! LSidebarToggle()
    let b = bufnr("%")
    execute "NERDTreeToggle | BuffergatorToggle"
    execute ( bufwinnr(b) . "wincmd w" )
  endf

  map  <silent> <Leader>w  <ESC>:call LSidebarToggle()<CR>
  map! <silent> <Leader>w  <ESC>:call LSidebarToggle()<CR>

  map <Leader>n :NERDTreeCWD<CR>
  map <Leader>b :BuffergatorOpen<CR>
  map <Leader>v :wincmd b<CR>

  map <Leader>] :bnext<CR>
  map <Leader>[ :bprevious<CR>
  map <Leader>} :blast<CR>
  map <Leader>{ :bfirst<CR>

  " Remove Tool+scroll bars
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
else
  " how to map C-6 instead of C-^ ? map <C-6> :buffer #<CR>
endif

" Change all [TAB] to 2 [SPACE]s
nnoremap \tc :%s:	:  :<CR><ESC>

" Change ALL whitespace to single [SPACE]
nnoremap \tcc :%s:\s\+: :<CR><ESC>

" Search Highlight
nnoremap \tl :set hlsearch!<CR><ESC>

nnoremap \tg <ESC>:TagbarOpenAutoClose<CR><ESC>
nnoremap \ts :set spell!<CR>
nnoremap \tm :ShowMarksToggle<CR>

noremap \h :echomsg 'F3=MRU  F6=Tagbar  F8=writer  F10=NeoBundleInstall  F11=Whitespace  '<CR>
noremap \em :Emodel
noremap \ev :Eview
noremap \ec :Econtroller
noremap \es :Espec
noremap \ej :Ejavascript
noremap \et :Etask

" F1  Toggle left (nerd/buffergator) TODO Fn keys should be universal
" F2  Pastetoggle
" F3  Save/run current ruby file TODO Fn keys should be universal
" F4  List buffers (bufexplorer)
" F5  Toggle wrap!
" F6  TagBarToggle (currently OFF)
" F7  Check current .rb syntax
" F9  Gundo Undo Tree
" F11 Toggle whitespace on/off (replace \tl?)
" F12 Re-source .vimrc
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :MRU<CR>
nnoremap <F3> :MouOpen %<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <F5> :set wrap!<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :!ruby -c %<CR>
nnoremap <F1> :NERDTreeTabsToggle<CR>
nnoremap <F9> :GundoToggle<CR>
nnoremap <F10> :NeoBundleInstall<CR>

" Highlight tabs/trailing/blank lines
nnoremap <F11> <ESC>:set hlsearch!<CR>/\s<CR><ESC>
nnoremap <F12> :so ~/.vimrc<CR>

nnoremap <silent> <C-T> :CtrlP<CR>
nnoremap <silent> <C-J> :bp<CR>
nnoremap <silent> <C-K> :bn<CR>

" Shift+Cmd+W closes ALL buffers
nnoremap <silent> <D-W> :qa<CR>
 

" INJECTIONS (delay set low: hit keys fast)
" See :help map-overview
inoremap {      {}<LEFT>
inoremap {<CR>  {<CR>}<ESC>O
inoremap {{     {
inoremap {}     {}
inoremap <silent> }   }<ESC>

inoremap <?     <?php  ?><LEFT><LEFT><LEFT>
inoremap <??    <?php echo  ?><LEFT><LEFT><LEFT>
inoremap <?r    <?php require_once('.php') ?><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap <?!    <?php die('<pre>' . var_dump(Array()) . '</pre>') ?><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

inoremap <%     <%  %><LEFT><LEFT><LEFT>
inoremap <%%    <%=  %><LEFT><LEFT><LEFT>

inoremap ccl    console.log();<LEFT><LEFT>
inoremap cc'    console.log('');<LEFT><LEFT><LEFT>
inoremap cc"    console.log("");<LEFT><LEFT><LEFT>

inoremap rri raise [].to_yaml<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap brp binding.remote_pry
inoremap brp binding.remote_pry

" Markdown newline. Space+Enter to end current line with 2 spaces
inoremap <SPACE><CR> <SPACE><SPACE><CR>

 " NOTE: All below is EXPERIMENTAL and probably breaks something
func! SayWordMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set thesaurus+=~/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! SayWord call SayWordMode() 

"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222 ctermbg=232
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=232

" neocomplcache - disable AutoComplPop
"--let g:acp_enableAtStartup = 0
"--let g:neocomplcache_enable_at_startup = 1
"--let g:neocomplcache_enable_smart_case = 1
"--let g:neocomplcache_enable_camel_case_completion = 1
"--let g:neocomplcache_enable_underbar_completion = 1
"--let g:neocomplcache_min_syntax_length = 2
"--let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"--
"--let g:neocomplcache_dictionary_filetype_lists = {
"--    \ 'default' : '/Library/Dictionaries/Oxford American Writer''s Thesaurus.dictionary',
"--    \ 'vimshell' : $HOME.'/.vimshell_hist',
"--    \ 'zsh' : $HOME.'/.zsh_history',
"--    \ 'sh' : $HOME.'/.bash_history',
"--    \ 'rails' : '/Library/Dictionaries/Rails 3.1.dictionary',
"--    \ }
"--
"--if !exists('g:neocomplcache_keyword_patterns')
"--  let g:neocomplcache_keyword_patterns = {}
"--endif
"--let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"--
"--imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"--smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"--inoremap <expr><C-g>     neocomplcache#undo_completion()
"--inoremap <expr><C-l>     neocomplcache#complete_common_string()
"--
"--" Recommended key-mappings.
"--" <CR>: close popup and save indent
"--" <C-h>, <BS>: close popup and delete backword char
"--inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"--inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"--inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"--inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"--inoremap <expr><C-y>  neocomplcache#close_popup()
"--inoremap <expr><C-e>  neocomplcache#cancel_popup()
"--
"--" Enable omni completion.
"--autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"--autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"--autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"--autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"--autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"--
"--highlight ExtraWhitespace ctermbg=111 guibg=#dd5555
"--autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
"--
"--" Enable heavy omni completion.
"--if !exists('g:neocomplcache_omni_patterns')
"--  let g:neocomplcache_omni_patterns = {}
"--endif
"--let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"--autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"--let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"--let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"--let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"--" /neocomplcache
"--
"--"let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
"--let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"--imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"--smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"--" SuperTab like snippets behavior
"--imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"--smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"--" For snippet_complete marker
"--if has('conceal')
"--  set conceallevel=2 concealcursor=i
"--endif
"--
"--" Dim inactive windows using 'colorcolumn'. May slow down redrawing on old machines
"--" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
"--function! s:DimInactiveWindows()
"--  for i in range(1, tabpagewinnr(tabpagenr(), '$'))
"--    let l:range = ""
"--    if i != winnr()
"--      if &wrap
"--        " HACK: when wrapping lines is enabled, we use the maximum number
"--        " of columns getting highlighted. This might get calculated by
"--        " looking for the longest visible line and using a multiple of
"--        " winwidth().
"--        let l:width=256 " max
"--      else
"--        let l:width=winwidth(i)
"--      endif
"--      let l:range = join(range(1, l:width), ',')
"--    endif
"--    call setwinvar(i, '&colorcolumn', l:range)
"--  endfor
"--endfunction
"--augroup DimInactiveWindows
"--  au!
"--  au WinEnter * call s:DimInactiveWindows()
"--  au WinEnter * set cursorline
"--  au WinLeave * set nocursorline
"--augroup END
"--
" \:let tmp0=&clipboard <BAR>
" \let &clipboard=''<BAR>
" \let tmp1=@"<BAR>
" \let tmp2=@0<CR>
" \y2l
" \:if '}}'=="<C-R>=escape(@0,'"\')<CR>"<BAR>

"au syntax * cal rainbow_parentheses#activate()
"au filetypedetect BufRead,BufNewFile *.txt setfiletype txtfmt

" FEATURES IN PROGRESS

" Rename (copy/del) current file with markdown extension
"   nnoremap \t :<CR>
"   file is ~/Desktop/wut.txt
"   we want ~/Desktop/wut.markdown
" :w %:p:r.markdown
" :e#
" :call "delete(#)

" ?
" nnoremap \t :<CR>

" ?
" nnoremap \t :<CR>

" Autoreload vimrc on edit
"augroup reload_vimrc " {
"    autocmd!
"    autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }
