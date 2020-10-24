# vim-qftoggle

qftoggle is a minimalistic plugin that allows you to toggle Vim/Neovim's
QuickFix and Location List windows. It also provides replacements for Vim's
`:cnext`-related commands that wrap to the other side of the error lists when
trying to move past either ends of the lists.

## Installation

qftoggle can be installed like any other typical plugin. For example, using the
plugin manager [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'seandewar/vim-qftoggle'
```

Or by simply using Vim 8's packages feature (`:help packages`):

```vim
packadd vim-qftoggle
```

## Commands

qftoggle defines the following commands:

- `:Ctoggle` for toggling the QuickFix list window
- `:Ltoggle` for toggling the Location list window for the current window
- `:Cnext`, `:Cprevious`, and `:CNext`; like Vim's `:cnext`, `:cprevious`, and
  `:cNext` commands (also optionally accepting a count argument), but can wrap
  around each end of the QuickFix list
- `:Lnext`, `:Lprevious`, and `:LNext`; which behaves as above, but for the
  Location list of the current window


## Mappings

In addition to these commands, qftoggle provides normal mode mappings for use in
your configurations. These plugin mappings are not automatically mapped to any
keys for you; you can map them to keys yourself by placing the following in your
vimrc, for example:

```vim
nmap <Leader>c <Plug>(qftoggle_toggle_quickfix)
nmap <Leader>l <Plug>(qftoggle_toggle_loclist)

nmap ]c <Plug>(qftoggle_quickfix_next)
nmap [c <Plug>(qftoggle_quickfix_previous)
nmap ]l <Plug>(qftoggle_loclist_next)
nmap [l <Plug>(qftoggle_loclist_previous)
```
