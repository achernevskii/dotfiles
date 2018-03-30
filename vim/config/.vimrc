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

" }}}

" UI Layout {{{

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

" Nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" You Complete Me
Plug 'Valloric/YouCompleteMe', { 'for': ['cpp', 'h', 'java'] }

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Vimtex for latex files
Plug 'lervag/vimtex', { 'for': 'tex'  }

" Gundo
Plug 'simnalamburt/vim-mundo'

" Undo Tree
Plug 'mbbill/undotree'

" Syntastic - for errors highlight
Plug 'vim-syntastic/syntastic'

" Vim-Airline (Lean & mean status/tabline for vim that's light as air)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
"Plug 'edkolev/tmuxline.vim'

" Vim syntax highlighting for i3 config
Plug 'mboughaba/i3config.vim'  { 'for': '.i3.config'}

" }}}

" Color schemes {{{

" Gruvbox
" https://github.com/morhetz/gruvbox
"Plug 'morhetz/gruvbox'

" Badwolf
" https://github.com/sjl/badwolf/
"Plug 'sjl/badwolf'

" Dracula
" https://github.com/dracula/vim
Plug 'dracula/vim'

" }}}

" Testing Plugins {{{

" Ctrlp -- for file search
"Plug 'kien/ctrlp.vim'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" }}}

" Initialize plugin system
call plug#end()

" Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" Airline {{{

set laststatus=2
" Old theme
"let g:airline_theme = 'zenburn'
let g:airline_theme = 'dracula'

let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

" }}}

" }}}

" Colors {{{
try
	colorscheme dracula
catch
endtry

set background=dark    

" }}}

" Key mappings {{{

" Nerd tree opening
map <C-e> :NERDTreeToggle<CR>

map <C-u> :UndotreeToggle<CR>

"map <C-w> :w!<cr>

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

" }}}
