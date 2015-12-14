## .vimrc for vim/macvim/vimR <http://github.com/lsd/vim>

* **recommended usage:** Rather than clone this repo, grab the vimrc file and save locally as `~/.vimrc` or copy into your `~/.vimrc`, install the `NeoBundle` vim plugin, open vim, run :NeoBundleInstall

I use VimR and MacVim but this setup should be OS-agnostic.
Please contribute/contact if you encounter problems.

Note that this cfg maps nearly all Fn keys, use/disable/edit as needed

## DEPENDENCIES

This config uses (and includes) NeoBundle for plugin management.
For manual installation, remove bundle/neobundle.vim from the repo
and follow the instructions on https://github.com/Shougo/neobundle.vim

## SCREENSHOT (outdated; I no longer use TagList)
![Alt text](https://raw.github.com/lsd/vim/master/screenshot-mac.png "MacVim 7.3 colorscheme wombat on 10.8.2 with Inconsolata:18")

## INSTALLATION
* Clone repo, `ln -s repo ~/.vim` then symlink `~/.vimrc` to `~/.vim/vimrc`
* Launch vim and run `:NeoBundleInstall` to install plugins

## CONSOLE VIM?
I disable the left/right sidebars when opening vim in a console. They only auto
open in MacVim because of how I use MacVim and vim. If you want these buffers
to open with vim, remove the if has("gui\_running") clause
