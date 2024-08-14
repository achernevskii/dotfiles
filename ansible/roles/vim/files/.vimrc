" vim configuration file
" destination folder /@user@/home/

""""""""""""""""""""""""""""""""""""
" Type:				   "
" :sorce ~/.vimrc	           "
" to reload config file		   "
""""""""""""""""""""""""""""""""""""
" :vert help <line in config file> "
" to see help page                 "
""""""""""""""""""""""""""""""""""""

" Sources {{{

" How To Vimrc
" https://dougblack.io/words/a-good-vimrc.html

" Vim 02 -- Конфигурация и плагины
" https://www.youtube.com/watch?v=VPENostK_3w

" Vim 03 -- Vim 03 - Плагины. Самое необходимое
" https://www.youtube.com/watch?v=pIcLJc85RDc

" The Ultimate Vimrc
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" Word wrap without line breaks
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks


" }}}

" UI Layout {{{

" Generic {{{

" Show current vim command in bottom bar
set showcmd

" Highlight current line
set cursorline 

" Graphical menu of all the matches you can cycle through (try to type :source ~/.vim)
set wildmenu

" Redraw only when we need to.
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Enable syntax highlighting
syntax enable

" Tells Vim to only wrap at a character in the breakat option (by default, this includes " ^I!@*-+;:,./?")
set linebreak

set ls=2 " Always show statusbar

" }}}

" GUI {{{

if has("gui_running")
	" Maximize GUI window
	set lines=999 columns=999

	" прячем панельки
	" "set guioptions-=m   " меню
	" set guioptions-=T    " тулбар
	" "set guioptions-=r   "  скроллбары
endif

" }}}

" }}}

" Language Support {{{

" YAML {{{

" This enables folding in yaml files
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
" This enables needed indent for the yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" }}}

" }}}

" Searching {{{

" Sets how many lines of history VIM has to remember
set history=500

" Ignore case while searching
set ignorecase

" Highlight search results
set hlsearch

" Highlight choosen search result
set incsearch

" For regular expressions turn magic on
set magic

" }}}

" Tmux {{{

" Allows cursor change in tmux mode
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" }}}

" Backups {{{

" Moves .swp files into /tmp directory, so they doesn't annoy.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}

" Plugins {{{

""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager -- Vim-Plug               "
" https://github.com/junegunn/vim-plug     "
"					   "
" Type :PlugInstall to install all plugins "
""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Installed Plugins {{{

" Project Navigation {{{

" Nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" }}}

" Langage support {{{

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" }}}

" Appearence {{{

" Vim-Airline (Lean & mean status/tabline for vim that's light as air)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes {{{

" Gruvbox
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" Badwolf
" https://github.com/sjl/badwolf/
"Plug 'sjl/badwolf'

" Dracula
" https://github.com/dracula/vim
"Plug 'dracula/vim'

" }}}

" }}}

" }}}

" Initialize plugin system
call plug#end()

" Airline {{{

set laststatus=2
" Old theme
let g:airline_theme = 'zenburn'
"let g:airline_theme = 'dracula'

let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

" }}}

" }}}

" Colors {{{
try
	colorscheme gruvbox
catch
endtry

set background=dark    

" }}}

" Key mappings {{{

" Nerd tree opening
map <C-e> :NERDTreeToggle<CR>

" }}}

" Organization {{{

" Tell vim to fold sections by markers, rather than indentation.
set foldmethod=marker

" Closes every fold by default
set foldlevel=0

" Tell vim only use these settings for this file.
" Modelines are special comments somewhere in a file that can can declare certain Vim settings to be used only for that file.
" So we'll tell Vim to check just the final line of the file for a modeline.
set modelines=1

" }}}

" Extra {{{

" Set to auto read when a file is changed from the outside
set autoread

set enc=utf-8 " utf-8 as default file encoding

" }}}

