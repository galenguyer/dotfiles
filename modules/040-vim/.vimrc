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

" better backspacing
set backspace=indent,eol,start
" set arrow keys to go between lines
set whichwrap+=<,>,h,l

" ignore case in search unless caps are used
set ignorecase
set smartcase
" highlight search results
set hlsearch

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

set background=dark

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}
Plug 'wakatime/vim-wakatime'

call plug#end()
