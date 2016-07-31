"
" Isam | http://github.com/lsd/vim | 07/23/2016
"
"   Written primarily on MacVim but should be agnostic
"   Currently experimenting heavily with VimR <vimr.org>
"   (auto open Markdown preview on BufRead currently off)
"
" Notice: Before using, read Caveats below
"
" Help: <Leader>h and <Leader>hh in INSERT mode. <ESC>\h<CR> opens cheatsheet
"   Internalize these keymaps:
"     \cu uncomment
"     \ci comment lines individually //..
"     \cm comment block /* */..
"     \cs comment pretty (?)
"     \cl or \cb comments aligned to left/BOL
"     \cA add comment at end of line
"     \c<space> toggle comment state
"
" Note: Everything else was moved to EXTRA.md
"
" Upcoming: 
"   Get YouCompleteMe and Unite setup
"   Significantly clean up vimrc
"   Ensure it works out of the box on Linux
"   Create simple optional setup script

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
  set nocompatible
  set timeoutlen=265
  set ttimeoutlen=100
  set smartindent
  set showmatch
  set smartcase
  set expandtab
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
  "set list listchars=tab:\I>trail:·
  set verbose=0
endfunction

function! PluginManagement()
  if has('vim_starting')
    if &compatible
      set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif
  filetype off
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

  """"""""""""""""""""""""""""""""""""""""""""
  " 2015 REFACTOR! XXX! TODO!
  " --- Iterate through bundles from conf file (Bundlefile, Vimscript, 
  " --- see http://vimawesome.com/plugin/endwise-vim
  """"""""""""""""""""""""""""""""""""""""""""

  NeoBundle 'Shougo/vimproc', { 'build' : { 'mac' : 'make -f make_mac.mak' }, }
  NeoBundle 'kien/ctrlp.vim.git'
  "
  "http://github.com/reedes/vim-colors-pencil
  "http://github.com/reedes/vim-lexical
  "http://github.com/reedes/vim-wordy
  "http://github.com/reedes/vim-pencil
  "
  " http://github.com/reedes/vim-thematic
  " NeoBundle 'reedes/vim-thematic'
  "
  NeoBundle 'tyru/open-browser.vim'
  " NeoBundle 'digitaltoad/vim-jade'
  "NeoBundle 'mikewest/vimroom'
  " NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'thinca/vim-ref'
  NeoBundle 'kshenoy/vim-signature'
  NeoBundle 'jeetsukumaran/vim-buffergator'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'vim-scripts/vim-auto-save'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'vim-scripts/mru.vim'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'jistr/vim-nerdtree-tabs'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'evanmiller/nginx-vim-syntax'
  NeoBundle 'https://github.com/bling/vim-airline'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-characterize'
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'juvenn/mustache.vim'
  NeoBundle 'vim-scripts/showMarks'
  "NeoBundle 'vim-scripts/applescript.vim'
  NeoBundle 'vim-scripts/Txtfmt-The-Vim-Highlighter'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'tilljoel/vim-automatic-ctags'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'tpope/vim-unimpaired'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'maxbrunsfeld/vim-emacs-bindings'
  " NeoBundle 'tpope/vim-surround'
  " NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-bundler'
  NeoBundle 'sophacles/vim-processing'
  NeoBundle 'L9'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'justinj/vim-react-snippets'
  NeoBundle 'tomtom/tlib_vim'
  NeoBundle 'marcweber/vim-addon-mw-utils'
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'marijnh/tern_for_vim'
  NeoBundle 'Valloric/YouCompleteMe'
  "NeoBundle 'Shougo/unite.vim'
  "NeoBundle 'git://github.com/tpope/vim-eunuch.git'
  "NeoBundle 'garbas/vim-snipmate'
  "NeoBundle 'eiginn/netrw'

  call neobundle#end()
  filetype plugin indent on
  set omnifunc=syntaxcomplete#Complete
  NeoBundleCheck
endfunction

function! SetAutoCommands()
  " Empty autocommands to avoid duplicate autocmd on :source %
  autocmd!

  " Autosave on blur (ignore warnings)
  " au FocusLost * silent! wa

  " Trim trailing whitespace

  " Change to current file's working dir
  au BufEnter * silent! lcd %:p:h

  " auto spellcheck git commits
  au FileType gitcommit setlocal spell

  " Universal Go style (gofmt) default is real tabs ts 8
  au BufRead,BufNewFile *.go setlocal nolist noexpandtab tabstop=8 shiftwidth=8 softtabstop=8

  " cat tags/README.md to learn how to generate the tag files.
  "au BufRead,BufNewFile *.rb set tags+=~/.vim/tags/ruby2.0.0.tags
  "au BufRead,BufNewFile *.py set tags+=~/.vim/tags/python3.3.tags

  au BufRead,BufNewFile composer.lock,*.as,*.json set ft=javascript
  au BufRead,BufNewFile *.pde set filetype=arduino
  au BufRead,BufNewFile *.ino set filetype=arduino

  " PHP (PSR-2 compliance: EOF needs newline, indent is 4 space tab, on newline)
  au BufRead,BufNewFile *.php,*.phps,*.phtml set tabstop=4 shiftwidth=4 softtabstop=4
  " au BufRead,BufNewFile *.php,*.phps set tags+=~/.vim/tags/php5.6.10.tags
  au BufRead,BufNewFile *.php,*.phps,*.phtml let php_minlines=500

  au BufRead,BufNewFile *.twig set ft=php

"  au BufRead,BufNewFile *.md call InitMarkdown()
"  au BufRead,BufNewFile *.mkd call InitMarkdown()
"  au BufRead,BufNewFile *.markdown call InitMarkdown()

  " turn off for now, as vimR has this feature
  " call OnWriteOverride()
endfunction

" If opening a Markdown file, set filetype to 'markdown' for diff extensions
" and open live preview of the buffer using a a shell script 'marko' (open -n -a /Applications/Marko.app "$@")
"function! InitMarkdown()
"  set ft=markdown
"  :!marko %
"endfunction

function! SetFnKeyMaps()
  set pastetoggle=<F2>
  nnoremap <F2> :set invpaste paste?<CR>
  nnoremap <F3> :MRU<CR>
  nnoremap <F4> :buffers<CR>:buffer<Space>
  nnoremap <F5> :set wrap!<CR>
  nnoremap <F6> :TagbarToggle<CR>
  nnoremap <F7> :e ~/.shell_aliases<CR>
"  call togglebg#map("<F8>")
"  nnoremap <F9> :GundoToggle<CR>
  nnoremap <F10> :NeoBundleInstall<CR>
  nnoremap <F11> <ESC>:set hlsearch!<CR>/\s<CR><ESC>
  nnoremap <F12> :so ~/.vimrc<CR>:echo "reloaded vimrc\n"<CR>

  " Drag Current Line Vertically
  nnoremap <C-j> :m+<CR>
  nnoremap <C-k> :m-2<CR>
  inoremap <C-j> <Esc>:m+<CR>
  inoremap <C-k> <Esc>:m-2<CR>
  vnoremap <C-j> :m'>+<CR>gv

  " TODO choose proper comment based on filetype. allow block comments,... NERD Commenter?
  map <C-c> I# <Esc>$<CR><Esc>
  nnoremap q :echo 'q recording disabled'<CR>
  nnoremap qq :echo 'qq recording disabled. Did you mean ``?'<CR>
endfunction

function! DisplayNotice()
endfunction

function! SetLeaderMaps()
  " unmap \t
  nnoremap \ts :set spell!<CR>

  "nnoremap \\ts :set spell!<CR>
  " Change all [TAB] to 2 [SPACE]s
  " nnoremap \tc :%s:	:  :<CR><ESC>

  " Change ALL whitespace to single [SPACE]
  nnoremap \tcc :%s:\s\+: :<CR><ESC>
  nnoremap \tl :set hlsearch!<CR><ESC>

  nnoremap \rf :call RunMe()<CR>
  nnoremap \lf :call LintMe()<CR>

" nnoremap \tg :TagbarOpenAutoClose<CR><ESC>
  nnoremap \tm :ShowMarksToggle<CR>
  cnoremap \vs :VimShellPop<CR>

" now use alt+cmd+P for preview
  nnoremap \omd :!marko %<CR>
  nnoremap \ov :!mvim %<CR>
  nnoremap \of :!open -R %<CR>
  nnoremap \orc :e ~/.vimrc<CR>:redraw<CR>:echo "\n* Use F12 to source .vimrc when done\n"<CR>

" noremap \em :Emodel
" noremap \ev :Eview
" noremap \ec :Econtroller
"  noremap \es :Espec
"  noremap \ej :Ejavascript
"  noremap \et :Etask
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

  "\ <Leader>t : unmapped - Delay to help \* \\* commands toggle easier\n
  let g:leaderMappings="\nList of Leader Key Mappings (\\)\n
  \ --------------------------\n
  \ <Leader>ts : Toggle spellcheck\n
  \ <Leader>tcw : Fix all ^I, ^M chars in buffer\n
  \ <Leader>tcc: Change all whitespace to 1 space\n
  \ <Leader>tl : Toggle search Highlight\n
  \ <Leader>tg : Toggle Tagbar Autoclose\n
  \ <Leader>tm : Toggle Show Line Marks\n
  \ <Leader>omd : Open current buffer with Marko.app. File must be .md\n\n
  \ <Leader>ov : Open current buffer in mvim\n\n
  \ <Leader>of : Reveal current file in Finder \n\n
  \ <Leader>orc : Open .vimrc in current buffer\n\n
  \ <Leader>h : List Fn key maps\n\n
  \ <Leader>hh : List Leader key maps\n\n"

"  \ Plugin rails.vim\n
"  \ --------------------------\n
"  \ <Leader>em : Emodel (rails.vim)\n
"  \ <Leader>ev : Eview\n
"  \ <Leader>ec : Econtroller\n
"  \ <Leader>es : Espec\n
"  \ <Leader>ej : Ejavascript\n
"  \ <Leader>et : Etask\n\n"

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
  inoremap ccd    console.debug();<LEFT><LEFT>
  inoremap dvd    die(var_dump(array(__FILE__.':'.__LINE__, )));<LEFT><LEFT><LEFT><LEFT>

  inoremap brp binding.remote_pry

  inoremap <C-CR> <SPACE><SPACE><CR>
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

  let g:netrw_http_cmd = "open"

  " Syntastic
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

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

  " vim-auto-save sets uptime to 200.
  " It autosaves in NORMAL mode only
  let g:auto_save = 1
  let g:auto_save_in_insert_mode = 0

  " vim-processing
  let g:processing_fold = 1
  let g:processing_doc_style = 'web'
  let g:processing_doc_path = '/tmp/p'

  " by default, JSX highlighting/indenting is only files .jsx. This adds
  " it to .js files
  let g:jsx_ext_required = 0

  " open+launch focus on new buffer in MacVim not vimR
  if has("gui_vimr")
    let g:nerdtree_tabs_open_on_gui_startup = 0
    let g:nerdtree_tabs_smart_startup_focus = 0
  endif

  if has("gui_macvim")
    let g:nerdtree_tabs_open_on_gui_startup = 1
    let g:nerdtree_tabs_smart_startup_focus = 2
  endif

  let g:nerdtree_tabs_open_on_console_startup = 0

  let g:MRU_Max_Entries=30
  let g:MRU_Max_Menu_Entries=20
  let g:MRU_Window_Open_Always=1

  let g:ScreenImpl = 'Tmux'

  set wildignore+=*.o,*.obj,.git,.svn,vendor/rails/**,tmp/**,publicystem/**
  let g:CommandTMaxCachedDirectories=10
  let g:CommandTMaxHeight=20

  let g:showmarks_enable = 0

  let g:vim_markdown_folding_disabled=0
  "let g:Powerline_symbols = 'fancy'
  let g:airline_powerline_fonts = 1
  set laststatus=2

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

  set bg=dark
  colors darkburn
  " if has("gui_running")
    " colorscheme solarized
    " set bg=light
  " else
    " colorscheme peachpuff
  " endif

  nnoremap <F1> :NERDTreeToggle<CR>

  if has("gui_running")
    set lines=65
    set columns=160
    " autocmd VimEnter * call LeftSidebarToggle()
    " nnoremap <F1> :call LeftSidebarToggle()<CR>

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
    set guifont=Sauce\ Code\ Powerline:h14
  endif
endfunction

function! OnWriteOverride()
  " autocmd!
  au FocusLost * :%s/\s\+$//ge
  au FocusLost * :set ff=unix
endfunction

function! InitializeVim()
  call PluginManagement()
  call SettingsGeneral()
  call SettingsDeveloper()
  " CAVEAT: This removes all current autocmds
  call SettingsPlugins()
  call SetAutoCommands()
  call SetFnKeyMaps()
  call SetLeaderMaps()
  call MappingHelper()
  call LittlePinPrick()
  syntax on
endfunction

call InitializeVim()

"function! PrintHighlightColors(msg)
"  let Highlight_Colors_2 = [
"      \ "WarningMsg",
"      \ "Question",
"      \ "Cursor",
"      \ "CursorIM"]
"  for color in Highlight_Colors_2
"    echohl color
"    echom color a:msg
"    echohl None
"  endfor
"endfunction
