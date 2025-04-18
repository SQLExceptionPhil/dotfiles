" Basic settings
set expandtab
set nowrap
set incsearch
set showcmd
set showmode
set showmatch
set hlsearch
set number

" Search and command enhancements
set wildmenu
set wildmode=list:longest
nnoremap <esc> :noh<CR>

" Clipboard integration
set clipboard=unnamedplus

" Syntax and filetype support
syntax on
filetype plugin indent on

" Cursor shape per mode (for terminals like Ghostty)
let &t_SI = "\e[6 q"  " Insert: bar
let &t_SR = "\e[4 q"  " Replace: underline
let &t_EI = "\e[2 q"  " Normal: block

" Visual feedback on yank
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
augroup END

