" Author: Sean Dewar <https://github.com/seandewar>
" Description: This file is auto-sourced by vim, and sets up the commands and
" mappings defined by this plugin.

if exists('g:loaded_qftoggle_plugin')
    finish
endif
let g:loaded_qftoggle_plugin = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

command! -bar Ctoggle call qftoggle#ToggleQuickfix('c', <q-mods>)
command! -bar Ltoggle call qftoggle#ToggleQuickfix('l', <q-mods>)

command! -bar -count=1 Cnext call qftoggle#QuickfixNext('c', <count>)
command! -bar -count=1 CNext call qftoggle#QuickfixNext('c', -<count>)
command! -bar -count=1 Cprevious CNext <count>

command! -bar -count=1 Lnext call qftoggle#QuickfixNext('l', <count>)
command! -bar -count=1 LNext call qftoggle#QuickfixNext('l', -<count>)
command! -bar -count=1 Lprevious LNext <count>

nnoremap <silent> <plug>(qftoggle_toggle_quickfix) :Ctoggle<cr>
nnoremap <silent> <plug>(qftoggle_toggle_loclist) :Ltoggle<cr>

nnoremap <silent> <expr> <plug>(qftoggle_quickfix_next)
            \ ':Cnext ' . v:count1 . '<cr>'
nnoremap <silent> <expr> <plug>(qftoggle_quickfix_previous)
            \ ':CNext ' . v:count1 . '<cr>'

nnoremap <silent> <expr> <plug>(qftoggle_loclist_next)
            \ ':Lnext ' . v:count1 . '<cr>'
nnoremap <silent> <expr> <plug>(qftoggle_loclist_previous)
            \ ':LNext ' . v:count1 . '<cr>'

let &cpoptions = s:save_cpo
unlet s:save_cpo
