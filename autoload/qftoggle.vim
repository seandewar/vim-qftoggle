" Plugin for toggling the quickfix and location list windows.
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
    let prev_winnr = winnr('#')
    let curr_winnr = winnr()

    " :lopen can cause E776 if no loclist is allocated for the current window
    " yet; squash the ugly error and echo a nice message instead
    try
        silent execute a:prefix . 'open'
    catch /^Vim\%((\a\+)\)\?:E776/
        echo 'No location list for window.'
        return
    endtry

    let was_open = winnr('$') == last_winnr
    let is_empty = empty(a:prefix == 'c' ? getqflist() : getloclist(0))

    if was_open || is_empty
        " :c/lopen steals focus; restore it to the original active window.
        "
        " if the list window was not the originally-active window, we need to
        " take care to ensure that the final last-accessed window is the
        " originally-last-accessed window, so that <C-W>p works as before.
        if curr_winnr == winnr()
            wincmd p
        else
            execute prev_winnr . 'wincmd w'
            execute curr_winnr . 'wincmd w'
        endif

        execute a:prefix . 'close'

        if is_empty && !was_open
            echo (a:prefix == 'c' ? 'QuickFix' : 'Window location')
               \ . ' list is empty.'
        endif
    endif
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
