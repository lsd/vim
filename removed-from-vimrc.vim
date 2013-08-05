 " NOTE: All below is EXPERIMENTAL and probably breaks something
"func! SayWordMode()
"  setlocal formatoptions=1
"  setlocal noexpandtab
"  map j gj
"  map k gk
"  setlocal spell spelllang=en_us
"  set thesaurus+=~/.vim/thesaurus/mthesaur.txt
"  set complete+=s
"  set formatprg=par
"  setlocal wrap
"  setlocal linebreak
"endfu
"com! SayWord call SayWordMode()

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
