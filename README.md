# vim-qftoggle

qftoggle is a minimalistic plugin that allows you to toggle Vim/Neovim's
QuickFix and Location List windows using the `:Ctoggle` and `:Ltoggle` commands
respectively.

qftoggle also provides the normal mode mappings
`<Plug>(qftoggle_toggle_quickfix)` and `<Plug>(qftoggle_toggle_loclist)` for
use in your configuations. These plugin mappings are not automatically mapped
to any keys for you; you can map them to keys yourself by placing the following
in your vimrc, for example:

```vim
nmap <Leader>c <Plug>(qftoggle_toggle_quickfix)
nmap <Leader>l <Plug>(qftoggle_toggle_loclist)
```

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
