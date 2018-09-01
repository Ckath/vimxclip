" simple plugin for using the system clipboard
" through xclip without +clipboard
" Last Change: 2018 Sep 01
" Maintainer: Ckat <ckat@teknik.io>
" License: MIT license, see LICENSE file

" give up if xclip isnt installed on the system
call system('type xclip')
if v:shell_error
    finish
endif

fun! SetClip()
    redir! > /tmp/clip
    silent echo @x
    redir end
    silent exec '!tail +2 /tmp/clip | xclip -selection clipboard'
endfun

fun! GetClip()
    let @x=system('xclip -o -selection clipboard')
endfun

au TextYankPost * if v:event['regname'] ==? "x" | call SetClip() | endif

" something that doesnt work in 99% of all setups
" just map :call GetClip()<CR> to a key instead
au FocusGained * call GetClip()
