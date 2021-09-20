" vim defaults instead of vi compatibility
set nocompatible

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
set softtabstop=4
" use spaces instead of tabs
set expandtab

" special file types
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType javascript,typescript,json,yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType latex,tex,markdown,md,text,gitcommit setlocal spell

" maintain 4 lines at the top or bottom when scrolling
set scrolloff=4

" better backspacing
set backspace=indent,eol,start
" set arrow keys to go between lines
set whichwrap+=<,>,h,l,[,]

" ignore case in search unless caps are used
set ignorecase
set smartcase
" don't highlight search results
set nohlsearch
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

" Pulled from /usr/share/vim/vim82/defaults.vim on arch
" Only do this part when Vim was compiled with the +eval feature.
if 1
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
  augroup END
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}
Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

call plug#end()
