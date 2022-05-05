" Automatic installation
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vim-lsp-settings
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'mattn/vim-goimports'

" Auto-complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Initialize plugin system
call plug#end()

syntax on

"viとの互換性を無効にする(INSERT中にカーソルキーが有効になる)
set nocompatible
"カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" set colorcolumn=80
set incsearch
set hlsearch
nmap <Esc><Esc> :nohl<CR>
set scrolloff=2
set et sw=4 sts=4
set list
set listchars=tab:>\ ,trail:-
" command completion
set wildmenu
set wildmode=longest:full,full
set laststatus=2

" カレント行ハイライトON
set cursorline
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

let lsp_signature_help_enabled = 0
let g:goimports_simplify = 1

if has("autocmd")
  augroup vimrc
    " Remove all vimrc autocommands
    autocmd!
    "ファイルタイプの検索を有効にする
    filetype plugin on
    "ファイルタイプに合わせたインデントを利用
    filetype indent on
    "sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtabの略
    autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
    autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
    autocmd FileType json        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType sh          setlocal sw=2 sts=2 ts=2 et
  augroup END
endif
