"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Michal Ciesielski Vimrc configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" START Vundle Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/badwolf'
Plugin 'godlygeek/tabular'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

Plugin 'tpope/vim-surround'

Plugin 'junegunn/fzf', {'dir': '~/.fzf', 'do': '/.install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/limelight.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki/vimwiki'



" ---------------------------- SNIPPETS
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ----------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=3  " open in new tab
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Configuration section
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow keys
let g:elite_mode=1

" Show commands in right bot corner
set showcmd

set t_Co=256
" colors zenburn
" colors goodwolf
colors badwolf

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set number
set cursorline
set showmatch

set incsearch
set hlsearch

set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" backspace over everything in insert mode
set backspace=indent,eol,start



"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" My key rebinds
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" let mapleader=","
inoremap jk <esc>
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> + :exe "vertical resize +1"<CR>
nnoremap <silent> - :exe "vertical resize -1"<CR>

map <C-m> :TagbarOpenAutoClose<CR>
" map <C-S-m> :TagbarToggle<CR>

map <leader>o :Files<CR>
map <leader>b :Buffers<CR>
map <leader>l :Lines<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" My snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType javascript,php,c map <leader>ccb
    \ I//            <Esc>A //<Esc>yyp0ellv$hhhhr-yykPjj
autocmd FileType javascript,php,c map <leader>ccl
    \ I// -<Esc>vy32pa <Esc>l
autocmd FileType ledger map <leader>d
    \ :r! date "+\%Y/\%m/\%d"<CR>
autocmd FileType ledger map <leader>Fh
    \ :r! date "+\%Y/\%m/\%d"<CR>
    \ o    Assets:PLN                                       -0.00 PLN<CR>
    \    Expenses:Food:Home                                0.00 PLN<Esc>

" those snippets require that ledger file has line in it:
" /* vim: set filetype=ledger : */
autocmd FileType ledger map <leader>fh
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:Food:Home                                <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * Food for home<Esc>jjj
autocmd FileType ledger map <leader>fw
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:Food:Work                                <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * Food at work<Esc>jjj
autocmd FileType ledger map <leader>ztm
    \ yypk
    \ I    Assets:PLN                                       <Esc>li-<Esc>A PLN<Esc>
    \ o    Expenses:ZTM                                      <Esc>kddpkJA PLN<Esc>kkk
    \ :r! date "+\%Y/\%m/\%d"<CR>A * ZTM<Esc>jjj

