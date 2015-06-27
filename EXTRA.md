## Features

  - Uses NeoBundle package
  - Autowrite when focus losed
  - Auto trim whitespace on write
  - Low timeoutlen/ttimeoutlen (256) (see Troubleshooting below)
  - Comes with themes solarized, zenburn, monokai *(working on a monochrome theme)*
  - Tab enters 2+ spaces instead of TAB key ^T
  - Uses Fixed width Powerline fonts

## Caveats

**Read the onWriteOverride func. It may not be behavior you want!
It runs automatically "call OnWriteOverride()"**

By default, backups go in ~/.vim/backups & ~/.vim/tmp
This vimrc maps most function (F1, ... F19) keys, use/edit as needed
to disable this, set `$VIM_NOBACKUPS == "true"`

Make sure $PATH is correct within vim. To check use :!echo $PATH
If incorrect, try putting your PATHs in /etc/paths. Example:

```
~/.rbenv/shims
/Applications/MAMP/bin/php/current/bin
/usr/local/share/npm/bin
/usr/local/bin
/usr/bin
/usr/local/sbin
/usr/sbin
/sbin
/bin
~/bin
```

Its important to have /u/l/b before /u/b else the non-exuberant
ctags is picked up and gives an error: 'illegal option -R'

## Troubleshooting

**Keymaps don't always register?**

  - Low timeoutlen means you need to hit KEYMAPS FAST
  - If undesired, comment out [t]timeoutlen lines or increase value

The following was removed from .vimrc to reduce clutter:

```
  " NeoBundle 'sophacles/vim-processing'
  " NeoBundle 'jplaut/vim-arduino-ino'
  " NeoBundle 'Shougo/vimshell'
  " NeoBundle 'thinca/vim-quickrun'
  " NeoBundle 'mattn/emmet-vim'
  " NeoBundle 'Slava/tern-meteor'
  " NeoBundle 'vim-scripts/vim-mou'
  " NeoBundle 'rcyrus/snipmate-snippets-rubymotion' 
  " NeoBundle 'fxn/vim-monochrome'
  " see https://github.com/honza/vim-snippets
  " NeoBundle 'vim-scripts/dbext.vim'
  " NeoBundle 'rodjek/vim-puppet'
  " NeoBundle 'fatih/vim-go'
  " NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
  " NeoBundle 'lsdr/monokai'
  " NeoBundle 'tpope/vim-rake'
  " NeoBundle 'tpope/vim-rails'
  " NeoBundle 'kchmck/vim-coffee-script'
  " NeoBundle 'vim-scripts/applescript.vim'
  " NeoBundle 'tpope/vim-haml'
  " NeoBundle 'Gundo'
 
" ------ wip / experimental

function! EditRc()
  echomsg "Open Marko preview? (Y) "
  let c = getchar()
  if c == 121 || c == 13

    exec '!marko ' . bufname('%')
  endif
endfunction

" (marko is a script /usr/local/bin/marko: open -n -a /Applications/Marko.app "$@")
" echo/prompt to open Marko if
"  - current buffer ft==mkd and at least N bytes saved
"  - unsaved buffer mkd and >M bytes long (save to tmp/open swap in Marko)
"  - opening new mkd file N bytes large

"  function! MkdDaemon()
"    echomsg "Open Marko preview? (Y) "
"    let c = getchar()
"    if c == 121 || c == 13
"      exec '!marko ' . bufname('%')
"    endif
"  endfunction
"
"  au! BufNewFile,BufRead *.md call MkdDetected()
"  au! BufNewFile,BufRead *.markdown call MkdDetected()
"  au! BufNewFile,BufRead *.mkd call MkdDetected()

" open and setup split
"function! DisplayStats()
    "let filetype = system('file ' . bufname("%"))

    "" Open split
    "vsplit __TempSplit__

    "" clear it. set filetype
    "normal! ggdG
    "setlocal filetype=markdown
    "setlocal buftype=nofile
"endfunction

" ------- TIPS / NOTES
" check variable value conditionally: if (&ftp=='ruby')
" call function
" set variable:
" get length of current filename: len(expand('%'))
" get chars in current file: !wc -c %
" no 'press enter' prompt: prefix silent, ie silent !clear
" clear current buffer: normal! ggdG
" open split: vsplit __Name__
" echom to display true msg. do not interprent newlines
" echo in red then set default color: <D-v> :echohl WarningMsg | echo 'fdny!' | echohl None
" getchar useful key maps: 13=<Enter> 121=y 27=escape 110=n 32=space
" save external output into var: let data = system('wc ' . bufname("%"))
```
