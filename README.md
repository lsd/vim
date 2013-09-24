###  vimrc for developers and power users
**Updated 09/22/2013  http://github.com/lsd/vim**

  Written with MacVim but should be OS-agnostic  
  Boilerplate GUI and shell vim rc. For developers, sysadmins, and  
  anyone who chooses vim as their tool to write code, prose &amp; notes.  

  You may want to turn off the auto FocusLost file write. The behavior  
  includes trimming whitespace, ff to unix, etc. See method OnWriteOverride  

  Features:  

  * Uses NeoBundle package
  * Autowrite when focus losed
  * Auto trim whitespace on write
  * Comes with themes including solarized, zenburn and monokai.
  * Tab enters 2+ spaces instead of TAB key ^T
  * Uses Fixed width Powerline Fonts
  * more...

## SCREENSHOT
![Alt text](https://raw.github.com/lsd/vim/master/screenshot-mac.png "MacVim 7.3 colorscheme wombat on 10.8.2 with Inconsolata:18")  


## NOTES

    Help: <Leader>h and <Leader>hh in INSERT mode. <ESC>\h<CR>  
    opens cheatsheet.  

    Tested on MacVim but should be agnostic. By default, backups  
    go in ~/.vim/backups & ~/.vim/tmp/.  To disable this, set  
    $VIM_NOBACKUPS == "true"  

    If keymaps don't always register? It might be the low 
    [t]timeoutlen values which mean you NEED TO HIT KEY MAPS  
    FAST. Increase value of [t]timeoutlen 

    Extraneous buffers are enabled in MacVim but not console  
    vim, for which toggle keys exist to open up NERDTree,  
    Taglist, MiniBuffexplorer, etc.  

## DEPENDENCIES

This config uses (and includes) NeoBundle for plugin management.  
For manual installation, remove bundle/neobundle.vim from the repo  
and follow the instructions on https://github.com/Shougo/neobundle.vim  

I also suggest getting and using patched powerline fonts.

## INSTALLATION

* Clone repo, symlink ~/.vimrc to repo/vimrc and ~/.vim to repo  
* Install the Inconsolata font in the fonts dir or remove the guifont line  
* Launch MacVim or vim and run :NeoBundleInstall to install the plugins  

## CONSOLE VIM?

I disable the left/right sidebars when opening vim in a console. They only auto  
open in MacVim because of how I use MacVim and vim. If you want these buffers  
to open with vim, remove the if has("gui\_running") clause  
