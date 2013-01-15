" Use Vim settings, rather then Vi settings, which is better.
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
" Due to problems that could arise http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

set ruler        " show the cursor position all the time

set backupdir=~/tmp        " tmp backup folder used by vim for files being edited

set shell=zsh\ -l        " Set shell to zsh interactive

:let mapleader = ","    " Change leader key from \ to ,
                        " Use <Leader> to define mapping with leader key

" :set timeoutlen         Set timeout of leader key press, Default is 1000 milliseconds

set t_Co=256          " enable 256 colors in vim

syntax on             " syntax highlight

colorscheme Tomorrow-Night

" Igor configuration
""""""""""""""""""""

" Use bang(!) to redefine a command or function, if already defined.
" Usefull when resourcing a vim configuration file

function! IgorSendCommand(text)
  let text = a:text
  let igor_send_command = "igor send-command "

  " Other potential functions to use if problems arise  
  "substitute(text,'\n','','g')
  "shellescape(text)
  
  execute "! " . igor_send_command . text

  " Echo out the message to vim display  
  echom igor_send_command . text
endfunction

nmap <Leader>i :call IgorSendCommand(@0) <CR><CR><CR>
