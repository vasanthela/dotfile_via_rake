set nocompatible               " Use Vim settings, rather than Vi
                               " Must be first

" Initialize Bundle plugin management
" ---
"   Descriptions of Bundle plugin
"   base16-vim: Base16 colorscheme plugin
"   nerdtree: File management plugin
"   ack.vim: Ack word searching integration
"   vim-fugitive: Git wrapper for vim
"   vim-markdown: Markdown helpers
"   ctrlp.vim: Full path fuzzy file, buffer, mru, tag, ... finder for Vim 
"   ag.vim - Vim plugin for the the_silver_searcher, replaces 'ack'
"   vim-room: Allows for distraction free writing in vim
"   vim-clojure-static: Clojure syntax, indent, and filetype settings, along with some nice user settings, like fuzzy indenting and pretty multiline strings.
"   vim-fireplace: Clojure REPL Interface
"   vim-classpath: Set 'path' from the Java class path
"
"Disabled bundle plugins
"   vim-rubocop - Runs RuboCop and displays the results in Vim
"   vim-notes: Note taking tool for vim
"   vim-misc: Miscellanious vim scripts used by vim-notes
"   rainbow_parentheses: Better rainbow parentheses
"   syntastic.git: Syntax checking

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
 Bundle 'gmarik/vundle'
 Bundle 'chriskempson/base16-vim'
 Bundle 'scrooloose/nerdtree.git'
 Bundle 'mileszs/ack.vim'
 Bundle 'tpope/vim-fugitive.git'
 Bundle 'scrooloose/nerdcommenter.git'
 Bundle 'tpope/vim-markdown.git'
 Bundle 'rking/ag.vim'
 Bundle 'kien/ctrlp.vim'
 Bundle 'mikewest/vimroom'
 Bundle 'nelstrom/vim-markdown-folding.git'
 Bundle 'guns/vim-clojure-static.git'
 Bundle 'tpope/vim-fireplace.git'
 Bundle 'tpope/vim-classpath.git'
 Bundle 'junegunn/limelight.vim'
 Bundle 'junegunn/goyo.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Custom vim settings
" ---

" Whitespaces
" ---
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
                                 " Due to problems that could arise
                                 " http://vim.wikia.com/wiki/Backspace_and_delete_problems
set expandtab                    " insert space characters when pressing tab key
set tabstop=2                    " a tab is 2 spaces
set shiftwidth=2                 " number of spaces to use for autoindenting
set autoindent                   " always set autoindenting on
set copyindent                   " copy the previous indentation on autoindenting
set shiftround                   " use multiple of shiftwidth when indenting with '<' and  '>'
"set smarttab                     " insert tabs on the start of a line according to
                                 "    shiftwidth, not tabstop
" set wrap                         " wraps lines (only visual)
"set linebreak                   " line break on whitespaces onl
"                                "   cannot use with set list

" List chars
" ---
set list                         " show invisible characters
set listchars=""                 " Reset the listchars
set listchars=tab:\ \            " a tab should display as " ", trailing whitespace as"."
set listchars+=trail:.           " show trailing spaces as dots
set listchars+=extends:>         " The character to show in the last column when wrap is
                                 " off and the line continues beyond the right of the screen
set listchars+=precedes:<        " The character to show in the last column when wrap is
                                 " off and the line continues beyond the left of the screen

" Search settings
" ---
set showmatch                    " set show matching parenthesis
set ignorecase                   " ignore case when searching
set smartcase                    " ignore case if search pattern is all lowercase,
                                 "    case-sensitive otherwise
set hlsearch                     " highlight search terms
set incsearch                    " show search matches as you type

" Color scheme
" ---
" set background=light
set background=dark
colorscheme base16-ocean         " base16 colorscheme
let base16colorspace=256         " Access colors present in 256 colorspace

" Appearance settings
" ---
set ruler                        " show the cursor position all the time
set number                       " always show line number
syntax on                        " syntax highlight
set cursorline                   " highlight the line the cursor is on
hi LineNr ctermfg=darkgrey ctermbg=black " color the fg and bg of line numbers

" Folding settings
" ---
"set nofoldenable                 " disable folding
set foldenable                    " enable folding
"set foldlevelstart=0             " start by having all folds closed
"set foldlevelstart=1             " all folds closed up to level 1
set foldlevelstart=3              " all folds closed up to level 2
set foldmethod=indent             " fold based on indent level

" space open/closes a fold
nnoremap <space> za
vnoremap <Space> za

" Misc
" ---
set shell=zsh\ -l                " Set shell to zsh interactive
set mouse=a                      " enable using the mouse if terminal emulator
                                 "    supports it (xterm does)

:let mapleader = ","             " Change leader key from \ to ,
                                 " Use <Leader> to define mapping with leader
                                 " key

:command WQ wq                   " Support shift <key> write or quit commands
:command Wq wq
:command W w
:command Q q
set nobackup
set noswapfile

" ========================
" Custom Commands
" =======================

" Command to set soft wrapping of text
"
" If you want to make Vim wrap long lines to fit in the window, you first
" have to enable :set wrap. By default Vim will break lines at exactly the
" width of the window, which causes some words to be split across two lines.
" To prevent this from happening, you can enable :set linebreak. The
" linebreak setting will not work when the list setting is enabled. So if you
" find that enabling linebreak does not produce the desired effect, try
" running :set nolist. To be sure, you can run the following command:
"
"   :set wrap linebreak nolist
" 
" The above commmands have been simplified into the command
"
"   :Wrap
"
" Reference http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist

" Press kj to escape
:imap kj <Esc>

" ========================
" Vim Plugin Configurations
" =========================

" NERDTree configurations
" ---
silent! nmap <leader>n :NERDTreeToggle<CR>  " <leader>n opens and closes NERDTree
":let NERDTreeQuitOnOpen = 1       " Quit NERDTree after opening a file

" ctrlp configurations
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'max:30'

" ag configurations
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" syntastic configurations
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" limelight
silent! nmap <leader>l :Limelight!!<CR>  " <leader>l toggles Limelight plugin

" goyo
silent! nmap <leader>g :Goyo<CR>  " <leader>l toggles Goyo plugin
