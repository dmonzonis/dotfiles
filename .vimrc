" Auto-install Vim-Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif

" Plugins using vim-plug
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'               " Add lots of cholorschemes
Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'       " Collection of themes for vim-airline
Plug 'sheerun/vim-polyglot'                 " Collection of language packs
Plug 'scrooloose/nerdcommenter'             " Easier commenting
Plug 'vim-syntastic/syntastic'              " Syntax checker
Plug 'rhysd/vim-clang-format'               " Format code using clang-format (required)
Plug 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespace
Plug 'tpope/vim-surround'                   " Mappings for treating brackets, quotes, etc in pairs
Plug 'terryma/vim-multiple-cursors'         " Multiple cursor support
Plug 'tpope/vim-fugitive'                   " Git wrapper for vim
Plug 'oblitum/YouCompleteMe', { 'do': 'python ./install.py --clang-completer' } " Autocompleter
Plug 'Raimondi/delimitMate'                 " Automatic closing of brackets
Plug 'SirVer/ultisnips'                     " Automatically generate code snippets
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy file finder for bash and vim
Plug 'junegunn/fzf.vim'

call plug#end()

" General settings
let mapleader = ' '         " Change leader key
set number                  " Show line number
set mouse=a                 " Enable mouse
set noshowmode              " Hide default mode text
set noshowcmd               " Disable command feedback in bottom-right corner
set nowrap                  " Disable line wrapping
set noswapfile              " No swap files
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent              " Automatically set line's indent on insert
set noerrorbells            " Disable annoying error sound bell
set novisualbell            " Disable error visual bell
set t_vb=                   " Disable error bell
set clipboard=unnamedplus   " Simplified copypaste
set foldmethod=indent       " Fold on indented blocks
set foldnestmax=2           " Set max nested fold level

" Theme
syntax on
colorscheme harlequin
let g:rehash256 = 1

" Language settings
set encoding=utf8
let $LANG='en'
set langmenu=en

" Airline Setup
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

" Airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⎇'

" YouCompleteMe Setup
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NerdTrimTrailingWhitespace = 1

" DelimitMate
let g:delimitMate_expand_cr = 1

" Enable filetype plugins
filetype plugin on
filetype indent on

func! NumberToggle()
    if(&relativenumber == 1)
    set nornu
    set number
    else
    set rnu
    endif
endfunc

" C/C++ Options
au FileType c,cpp setlocal comments-=:// comments+=f:// " Disable automatic comment insert for single-line comments

" Mappings
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>r :call NumberToggle()<CR>
map <leader>p :bp<CR>
map <leader>n :bn<CR>
" FZF
nnoremap <C-p>a :Ag
nnoremap <C-p>b :Buffers<CR>
nnoremap <C-p>c :Commands<CR>
nnoremap <C-p>f :Files<CR>
nnoremap <C-p>g :GitFiles<CR>
nnoremap <C-p>r :History<CR>
nnoremap <C-p>: :History:<CR>
nnoremap <C-p>/ :History/<CR>
nnoremap <C-p>l :BLines<CR>
nnoremap <C-p>m :Marks<CR>
nnoremap <C-p>t :Tags<CR>

" Autocmd
autocmd bufwritepre *.cpp ClangFormat
autocmd bufwritepre *.h ClangFormat



