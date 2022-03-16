" --- --- --- --- --- --- --- --- --- ----
" My minimalist vim config for;
"  C, and Bash development
" --- --- --- --- --- --- --- --- --- ----

" --- --- --- --- --- --- --- --- --- ----
" Load plugins
"
" ycm installation details
"   -> https://vimawesome.com/plugin/youcompleteme
" --- --- --- --- --- --- --- --- --- ----
call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'lifepillar/vim-solarized8'
call plug#end()
" packadd termdebug

" --- --- --- --- --- --- --- --- --- ----
" Config YCM
" --- --- --- --- --- --- --- --- --- ----
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif

" --- --- --- --- --- --- --- --- --- ----
"   If possible enable termguicolors
" --- --- --- --- --- --- --- --- --- ----
if (has("termguicolors"))
 set termguicolors
endif

" --- --- --- --- --- --- --- --- --- ----
"   Config termdebug (currently disabled)
" --- --- --- --- --- --- --- --- --- ----
set mouse=a
" let g:termdebug_wide=1

" --- --- --- --- --- --- --- --- --- ----
" Other
" --- --- --- --- --- --- --- --- --- ----
set nocompatible
set bg=dark
color solarized8_flat
colorscheme solarized8_flat
syntax on
filetype plugin on
" set autochdir
set number relativenumber
set tabstop=4 expandtab shiftwidth=4 smartindent 
set path+=**
set wildmenu 

" ctrl remaps
nnoremap <C-n> :bnext <CR>
nnoremap <C-p> :bprevious <CR>
nnoremap <C-o> :only <CR>
nnoremap <C-f> :find 
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-u> :UndotreeToggle <CR>

" space remaps
let mapleader = " "
nnoremap <leader>f :YcmCompleter GetDoc <CR>
nnoremap <leader>g :YcmCompleter GoToDefinition <CR>
nnoremap <leader>G :YcmCompleter GoToReferences <CR>
" nnoremap <leader>d :Termdebug <CR> 
    " | hi debugPC term=reverse ctermbg=4 guibg=darkblue
    " | hi debugBreakpoint term=reverse ctermbg=red guibg=red

" C maps
autocmd FileType c command Debug :!gdb $(basename % .c) --eval-command="set style enable off" --eval-command="set logging on" --eval-command="layout src"<CR>

" other maps
command Reload :e %
