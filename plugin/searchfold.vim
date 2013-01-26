"------------------------------------------------------------------------------
" Name Of File: searchfold.vim
"
"  Description: Vim plugin to search for a word and fold any non matching
"               text.
"
"       Author: Juan Frias (juandfrias at gmail.com)
"
"  Last Change: 2007 Feb 23
"      Version: 1.00
"
"    Copyright: Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this header
"               is included with it.
"
"               This script is to be distributed freely in the hope that it
"               will be useful, but is provided 'as is' and without warranties
"               as to performance of merchantability or any other warranties
"               whether expressed or implied. Because of the various hardware
"               and software environments into which this script may be put,
"               no warranty of fitness for a particular purpose is offered.
"
"               GOOD DATA PROCESSING PROCEDURE DICTATES THAT ANY SCRIPT BE
"               THOROUGHLY TESTED WITH NON-CRITICAL DATA BEFORE RELYING ON IT.
"
"               THE USER MUST ASSUME THE ENTIRE RISK OF USING THE SCRIPT.
"
"               The author does not retain any liability on any damage caused
"               through the use of this script.
"
"      Install: 1. Read the section titled 'Options'
"               2. Setup any variables need in your vimrc file
"               3. Copy 'searchfold.vim' to your plugin directory.
"
"  Mapped Keys: <Leader>s   Begin a search.
"
"        Usage: Start searchfold by pressing the mapped key and a prompt will
"               come up with the word under the cursor.
"
"               Press enter to begin search with word displayed.
"
"               Or type '\c' without quotes and press enter to begin search
"               with displayed word but do a case insensitive search.
"
"               Or type in your own word or expression to pass to the search
"               function and press enter to begin the search.
"
"               Once the file has been folded the following keys are available
"               to navigate.
"
"                   e    - exit and keep folds.
"                   q    - quit and restore folds and cursor position.
"                   <cr> - quit restore folds and keep cursor at current
"                          position.
"
"                   j    - Down/Next match.
"                   k    - Up/Previous match.
"
"                   J    - Scroll Down.
"                   K    - Scroll Up.
"
"                   m    - More context
"                   l    - Less context
"
"
"------------------------------------------------------------------------------
" Please send me any bugs you find, so I can keep the script up to date.
"------------------------------------------------------------------------------
"
" User Options: {{{1
"------------------------------------------------------------------------------
"
" <Leader>s
"       This is the default key map to start a search. Search for 'key' to
"       overwrite this key.
"
" g:sfContextDecrement
"       This is the number of lines that the fold will close each time
"       the close key is hit.
"
"       To overwrite use:
"
"           let g:sfContextDecrement = <desired number of lines>
"
"       in your vimrc file.
"
"       example:
"           let g:sfContextDecrement = 3
"
" g:sfContextIncrement
"       This is the number of lines that the fold will open each time
"       the close key is hit.
"
"       To overwrite use:
"
"           let g:sfContextIncrement = <desired number of lines>
"
"       in your vimrc file.
"
"       example:
"           let g:sfContextIncrement = 3
"
" g:sfContextLines
"       This is the number of lines that the match will have on top and on the
"       bottom at the beginning of the search.
"
"       To overwrite use:
"
"           let g:sfContextLines = <desired number of lines>
"
"       in your vimrc file.
"
"       example:
"           let g:sfContextLines = 3
"

" Global variables: {{{1
"------------------------------------------------------------------------------

" Load script once
"------------------------------------------------------------------------------
if exists("loaded_searchfold") || &cp
    finish
endif
let loaded_searchfold = 1

"--------------------------------------------------------------------------
if !exists("g:sfContextDecrement")
    let g:sfContextDecrement = 2
endif
"--------------------------------------------------------------------------
if !exists("g:sfContextIncrement")
    let g:sfContextIncrement = 6
endif
"--------------------------------------------------------------------------
if !exists("g:sfContextLines")
    let g:sfContextLines = 3
endif

" Function: Search the file. {{{1
"--------------------------------------------------------------------------
function! s:SearchFile(word)
    let l:last_match = 0
    let l:context = g:sfContextLines

    " Move to the beginning of the file, begin search don't wrap.
    normal gg
    while search(a:word, "W") > 0

        let l:curr_line = line(".")

        " Don't fold if they're too close.
        if (l:last_match + ( 2 * l:context )) >= l:curr_line
            let l:last_match = l:curr_line
            continue
        endif

        " If there is no previous fold start fold at the beginning of the
        " file.
        if l:last_match == 0
            let l:begin = 1
        else
            let l:begin = l:last_match + l:context
        endif

        " Find the end of the fold.
        let l:end = l:curr_line - l:context

        " Fold it!
        exe l:begin.",".l:end."fold"

        " Update last match.
        let l:last_match = l:curr_line
        normal $
    endwhile

    " Fold if there is room at the end of the file.
    if (l:last_match + l:context) < line("$")
        exe (l:last_match+l:context).",".line("$")."fold"
    endif

    " Highlight all matching words.
    let @/ = a:word

endfunction

" Function: Fix match within a fold. {{{1
"--------------------------------------------------------------------------
function! s:FixFold()
    " Some times when you reduce the folds so much that it 'eats' up another
    " match this function will split a fold that has a match and create two.

    " If this is a fold
    if foldlevel(line("."))

        " Set begin and end of top fold
        let l:begin1 = foldclosed(line("."))
        let l:end1   = line(".") - g:sfContextLines

        " Set begin and end of bottom fold
        let l:begin2 = line(".") + g:sfContextLines
        let l:end2   = foldclosedend(line("."))

        " Delete the fold
        normal zd

        " If it's a valid fold create it.
        if l:begin1 < l:end1
            exe l:begin1.",".l:end1."fold"
        endif
        if l:begin2 < l:end2
            exe l:begin2.",".l:end2."fold"
        endif
    endif
endfunction

" Function: Highlight line. {{{1
"--------------------------------------------------------------------------
function! s:HighlightLine()
    " Make sure that the match has not been 'eaten-up' by a fold while
    " reducing folds.
    call s:FixFold()

    " Clear previous, Highlight, center and display.
    match
    exe 'match Visual /\%'.line(".").'l.*/'
    normal zz
    redraw
endfunction

" Function: Handle expansion/contraction. {{{1
"--------------------------------------------------------------------------
function! s:ModifyView(expand)
    let l:curr_line = line(".")

    " Set the adjust factor a:expand = 1 to expand or -1 to contract.
    if a:expand < 0
        let l:adjust = g:sfContextDecrement * a:expand
    else
        let l:adjust = g:sfContextIncrement
    endif

    " Adjust Top fold
    normal zk
    if foldlevel(line("."))
        let l:begin = foldclosed(line("."))
        let l:end   = foldclosedend(line(".")) - l:adjust
        if l:end < l:curr_line
            normal zd
            if l:begin < l:end
                exe l:begin.",".l:end."fold"
            endif
        endif
    endif

    " Adjust Bottom fold
    exe "normal ".l:curr_line."G"
    normal zj
    if foldlevel(line("."))
        let l:begin = foldclosed(line(".")) + l:adjust
        let l:end   = foldclosedend(line("."))
        if l:begin > l:curr_line
            normal zd
            if l:begin < l:end
                exe l:begin.",".l:end."fold"
            endif
        endif
    endif

    " Move to current line
    exe "normal ".l:curr_line."Gzz"

    redraw
endfunction

" Function: main - Driver function. {{{1
"--------------------------------------------------------------------------
function! s:SearchFold()
    " Init local vars
    let l:current_word = expand("<cword>")
    let l:bufname = expand("%")
    let l:curr_line = line(".")

    " Get the expression to search for {{{2
    " -------------------------------------

    " If the word is too big then blank it out this is to prevent dividers to
    " be picked up as words.
    if strlen(l:current_word) > 30
        let l:current_word = ""
    endif

    " Ask to verify the word
    echohl Search
    let l:search_word = input("Search for: ".l:current_word."?")
    echohl None

    " If no new word was given use the one we picked up.
    if strlen(l:search_word) == 0
        let l:search_word = l:current_word
    endif

    " If only \c was passed then append it to the begining
    if l:search_word == "\\c"
        let l:search_word = l:search_word.l:current_word
    endif

    " Check for a match in the file and exit if there aren't any.
    if !search(l:search_word, 'w')
        echohl Search
        echo "No matches found"
        echohl None
        return
    endif
    "}}}

    " Save current settings {{{2
    redir @"
    set foldmethod
    set foldmarker
    redir END
    let l:old_fold = "set".substitute(@", "\n", "", "g")
    let l:old_fold = substitute(l:old_fold, "foldmarker", "\\| set \\0", "g")
    let l:temp_view = tempname()
    exe "mkview! ".l:temp_view
    " }}}

    " Setup settings needed
    set foldmarker=<<<,>>>
    set foldmethod=manual
    sil! normal zE

    " Fold away
    call s:SearchFile(l:search_word)
    exe "normal ".l:curr_line."GzMzz0n"
    call s:HighlightLine()
    normal! zz

    " Display status line
    echohl Search
    echo "<cr>-Quit(here) q-Quit(prev), e-Exit(keep folds) jk-Next/Prev JK-Up/Down ml-More/Less +-(inc/dec)"
    echohl NONE

    " Process keystrokes {{{2
    while 1
        let l:op = getchar()

        " e    - exit and keep folds.
        " q    - quit and restore folds and cursor position.
        " <cr> - quit restore folds and keep cursor at current position.
        if nr2char(l:op) == 'e' || nr2char(l:op) == 'q' || l:op == char2nr("\<cr>")

            " Overwrite old position with new one.
            if nr2char(l:op) != 'q'
                let l:curr_line = line(".")
            endif

            " clear highlight
            match

            " Delete all folds, restore fold settings, and restore view.
            if nr2char(l:op) != 'e'
                sil! normal zE
                exe l:old_fold
                sil! exe "so ".l:temp_view
            endif

            " delete the temporary view
            call delete(l:temp_view)

            " Go to the desired line center screen and if we are at a fold
            " open it.
            exe "normal ".l:curr_line."Gzz"
            if foldlevel(line(".")) > 0
                normal zO
            end

            " done.
            break
        endif

        " Down / find next.
        if nr2char(l:op) == 'j'
            sil! exe "normal $n"
            call s:HighlightLine()
        endif

        " Scroll Up
        if nr2char(l:op) == "J"
            sil! exe "normal 5\<c-e>"
            redraw
        endif

        " Up / find previous.
        if nr2char(l:op) == 'k'
            sil! exe "normal 0N"
            call s:HighlightLine()
        endif

        " Scroll Down.
        if nr2char(l:op) == "K"
            sil! exe "normal 5\<c-y>"
            redraw
        endif

        " More context
        if nr2char(l:op) == 'm'
            call s:ModifyView(1)
        endif

        " Less Context
        if nr2char(l:op) == 'l'
            call s:ModifyView(-1)
        endif

    endwhile
    " end Process keystrokes }}}

endfunction
"}}}

" Default key mapping to start search.
"------------------------------------------------------------------------------
nnoremap <silent> <Leader>s :call <sid>SearchFold()<cr>

" vim:tw=78:fdm=marker:
