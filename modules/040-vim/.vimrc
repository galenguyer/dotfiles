" vim defaults instead of vi compatibility
:set nocompatible

" enable auto indenting and plugins based on filetype detection
if has('filetype')
    filetype indent plugin on
endif
" if no indent is specified for the file type, keep the indent at the current level
set autoindent

" enable syntax highlighting
if has('syntax')
    syntax on
endif

" set tab width to 4 spaces
set shiftwidth=4
set tabstop=4

" use spaces instead of tabs
set expandtab

" maintain 10 lines at the top or bottom when scrolling
set scrolloff=10

" better backspacing
set backspace=indent,eol,start
" set arrow keys to go between lines
set whichwrap+=<,>,h,l,[,]

" ignore case in search unless caps are used
set ignorecase
set smartcase
" highlight search results
set hlsearch
" highlight while typing search
set incsearch

" enable use of the mouse for all modes
if has('mouse')
    set mouse=a
endif

" prompt to save file on exit
set confirm

" use the visual bell instead of beeping
set visualbell
set t_vb=

" display line numbers
set number

" show matching brackets
set showmatch

" enable command completion
set wildmenu
set wildmode=list:longest
" never suggest these files
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set background=dark

" clear the status line
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdtree'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
