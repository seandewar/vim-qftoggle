" Plugin for toggling the quickfix and location lists.
" Author: Sean Dewar <https://github.com/seandewar>
" Description: Contains the main plugin functionality to be lazily-sourced by
" vim when needed.

if exists('g:loaded_qftoggle')
    finish
endif
let g:loaded_qftoggle = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

function! qftoggle#ToggleQuickfix(prefix) abort
    " we will test to see if the qf/loclist window is already open by trying to
    " open it again; if it is already open, :c/lopen will not open another
    " window, causing the number of the last window to remain the same
    let last_winnr = winnr('$')

    " :lopen can cause E776 if no loclist is allocated for the current window
    " yet; squash the ugly error and echo a nice message instead
    try
        silent execute a:prefix . 'open'
    catch /^Vim\%((\a\+)\)\=:E776/
        echo 'No location list for window.'
        return
    endtry

    let was_open = winnr('$') == last_winnr
    let is_empty = empty(a:prefix == 'c' ? getqflist() : getloclist(0))

    if was_open || is_empty
        wincmd p " :c/lopen steals focus; return it to the previous window
        execute a:prefix . 'close'

        if is_empty && !was_open
            echo (a:prefix == 'c' ? 'QuickFix' : 'Window location')
               \ . ' list is empty.'
        endif
    endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
