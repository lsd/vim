## .vimrc for MacVim/console web dev
#### Updated 08/2014  <http://github.com/lsd/vim>
#### This is WORK IN PROGRESS


* **recommended usage:** Rather than clone this repo, grab the vimrc file and save locally as ~/.vimrc or copy into your own ~/.vimrc, install the NeoBundle vim plugin, and run :NeoBundleInstall to install plugins

I use MacVim but this setup should be OS-agnostic.  
Please contribute/contact if you encounter problems.  
   
Extraneous buffers are enabled in MacVim but not console vim, for which toggle keys   
exist to open up NERDTree, Taglist, MiniBuffexplorer, etc.  
Note that this cfg maps nearly all Fn keys, use/disable/edit as needed  
   

## DEPENDENCIES
This config uses (and includes) NeoBundle for plugin management.  
For manual installation, remove bundle/neobundle.vim from the repo  
and follow the instructions on https://github.com/Shougo/neobundle.vim  

## SCREENSHOT
![Alt text](https://raw.github.com/lsd/vim/master/screenshot-mac.png "MacVim 7.3 colorscheme wombat on 10.8.2 with Inconsolata:18")  

## INSTALLATION
* Clone repo, symlink ~/.vimrc to repo/vimrc and ~/.vim to repo  
* Install the Inconsolata font in the fonts dir or remove the guifont line  
* Launch MacVim or vim and run :NeoBundleInstall to install the plugins  

## CONSOLE VIM?
I disable the left/right sidebars when opening vim in a console. They only auto  
open in MacVim because of how I use MacVim and vim. If you want these buffers  
to open with vim, remove the if has("gui\_running") clause  
