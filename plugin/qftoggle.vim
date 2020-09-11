" Plugin for toggling the quickfix and location list windows.
" Author: Sean Dewar <https://github.com/seandewar>
" Description: This file is auto-sourced by vim, and sets up the commands and
" mappings defined by this plugin.

if exists('g:loaded_qftoggle_plugin')
    finish
endif
let g:loaded_qftoggle_plugin = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

command! -bar Ctoggle call qftoggle#ToggleQuickfix('c')
command! -bar Ltoggle call qftoggle#ToggleQuickfix('l')

nnoremap <silent> <plug>(qftoggle_toggle_quickfix) :Ctoggle<cr>
nnoremap <silent> <plug>(qftoggle_toggle_loclist) :Ltoggle<cr>

let &cpoptions = s:save_cpo
unlet s:save_cpo
