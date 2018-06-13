"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leiwen's vimrc 
" Version: 1.3 8/17/2016
"
" General
" Colors and Fonts
" Tabs
" Files, backups and undo
" VIM UI
" Moving around, tabs, windows, and buffers
" Status line
" Key Mappings
" Visual mode
" Misc
" Spell checking
" Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700
set backspace=2

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Automaticall change current dir
" set autochdir
" autocmd BufEnter * silent! lcd %:p:h

set wildmode=longest,list,full
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
" au BufNewFile,BufRead *.cpp set syntax=cpp11

" set background=dark
colorscheme monokai
" colorscheme desert
" colorscheme blackdust

" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Font settings
set guifont=Monospace\ 9
" Allow F1/F2 to toggle font
:map <F1> :set guifont=Monospace\ 10 <CR>
:map <F2> :set guifont=Monospace\ 9 <CR>
:map <F3> :set guifont=Monospace\ 8 <CR>
nnoremap <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" Highlight current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" == soft tabs ==
set expandtab shiftwidth=4 softtabstop=4

" == hard tabs ==
"set shiftwidth=2

" == mixed tabs, don't use ==
"set shiftwidth=2 softtabstop=2

" == other tabs  ==
set tabstop=4 " width of a TAB always 4
set wrap
set autoindent
"set cindent
"set smartindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" search
set incsearch ignorecase hlsearch smartcase
" press space to clear the search
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" line nums
set number
set ruler

" matching brackets
set showmatch
set mat=2

" Height of the command bar
" set cmdheight=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  " set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" select, copy and paste
if has('mouse')
    set mouse=a
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" set statusline=\ %{HasPaste()}%F%m%r%h
" set statusline+=%#CursorColumn#
set statusline+=%#PmenuSel#
set statusline+=\ %f " also %w and %F
set statusline+=\ 
set statusline+=%#LineNr#
set statusline+=\ CWD:\ %r%{getcwd()}%h
set statusline+=%=
set statusline+=%#PmenuSel#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l/%L:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nmap <c-s> :w<CR>
:imap <c-s> <Esc><c-s>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
      return 'PASTE MODE  '
  en
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" vp doesn't replace paste buffer
" function! RestoreRegister()
"   let @" = s:restore_reg
"   return ''
" endfunction
" function! s:Repl()
"   let s:restore_reg = @"
"   return "p@=RestoreRegister()\<cr>"
" endfunction
" vmap <silent> <expr> p <sid>Repl()
