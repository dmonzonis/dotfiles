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
Plug 'scrooloose/nerdcommenter'             " Easier commenting
" Plug 'vim-syntastic/syntastic'              " Syntax checker
Plug 'rhysd/vim-clang-format'               " Format code using clang-format (required)
Plug 'ntpeters/vim-better-whitespace'       " Highlight trailing whitespace
Plug 'Raimondi/delimitMate'                 " Automatic closing of brackets
Plug 'SirVer/ultisnips'                     " Automatically generate code snippets
Plug 'honza/vim-snippets'                   " Add snippets for UltiSnips for different languages
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'} " Fuzzy file finder for bash and vim
Plug 'junegunn/fzf.vim'
Plug 'python-mode/python-mode'              " Bunch of utilities for python
Plug 'morhetz/gruvbox'                      " Theme
Plug 'yggdroot/indentline'                  " Show vertical line on indented lines
Plug 'lervag/vimtex'                        " Utilities for LaTeX
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}  " LSP support
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
set hidden                  " Allow to hide modified buffer

" Allow persistent undo using an undo history file (undofile)
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700) " Permissions only for owner
endif
set undodir=~/.vim/undo-dir
set undofile

" Theme
set background=dark
colorscheme gruvbox
let g:rehash256 = 1

" Language settings
set encoding=utf8
let $LANG='en'
set langmenu=en

" Airline Setup
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Enable buffer listing
let g:airline#extensions#tabline#fnamemod = ':t' " But show just the filename

" Syntastic Setup
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_checkers = ['clang_tidy']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501' " Ignore line too long

" Airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '⎇'

" LanguageClient
let g:LanguageClient_serverCommands = {
            \ 'python': ['pyls'],
            \ 'cpp': ['~/cquery/build/release/bin/cquery',
            \ '--log-file=/tmp/cq.log', '--init=("cacheDirectory":"/var/cquery/")']
            \ }

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NerdTrimTrailingWhitespace = 1

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']

" UltiSnips
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-k>"
let g:UltiSnipsJumpBackwardTrigger = "<C-e>"

""" Python-mode
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 99
let g:pymode_run_bind = '<F5>'
" Disable stuff
let g:pymode_breakpoint = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on

" Toggle between absolute and relative line numbering
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
map <leader>d :bd<CR>
nnoremap <F5> "=strftime("%d/%m/%y")<CR>
inoremap <F5> <C-R>=strftime("%d/%m/%y")<CR>
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
"autocmd bufwritepre *.cpp ClangFormat
"autocmd bufwritepre *.h ClangFormat
