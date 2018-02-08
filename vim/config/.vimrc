"""""""""""
" Sources "
"""""""""""

" Vim 02 -- Конфигурация и плагины
" https://www.youtube.com/watch?v=VPENostK_3w

" Vim 03 -- Vim 03 - Плагины. Самое необходимое
" https://www.youtube.com/watch?v=pIcLJc85RDc

"""""""""""
"""""""""""

" Set line numbers
set number

" Highlight search results
set hlsearch
" Highlight choosen search result
set incsearch

" Syntax highlight
" syntax on


""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager -- Vim-Plug               "
" https://github.com/junegunn/vim-plug     "
"					   "
" Type :PlugInstall to install all plugins "
""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading

"""""""""""""""""
"    Plugins    "
"""""""""""""""""

" Nerd tree
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


" You Complete Me
" https://github.com/Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Auto pairs
" https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" Ctrlp -- for file search
" https://github.com/kien/ctrlp.vim
Plug 'kien/ctrlp.vim'



"""""""""""""""""
"""""""""""""""""

"""""""""""""""""
" Color schemes "
"""""""""""""""""

" Gruvbox
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

"""""""""""""""""
"""""""""""""""""


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

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

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""
" Current color scheme "
""""""""""""""""""""""""
colorscheme gruvbox
set background=dark    
""""""""""""""""""""""""

" mappings

" Nerd tree opening
map <C-e> :NERDTreeToggle<CR>
