set nocompatible        " vim only please 

let mapleader=","       " follow the leader

set backspace=2         " backspace deletes like most programs in insert mode
set nobackup            " don't backup files
set nowritebackup       " don't backup before overwriting files
set noswapfile          " avoid annoying swap file errors
set history=50          " increase history
set ruler               " show cursor position at all times
set showcmd             " display incomplete commands
set incsearch           " incremental searching
set hlsearch            " highlight search
set laststatus=2        " always display the status line
set autowrite           " automatically :write before running commands
set relativenumber      " relative line numbers by default
set clipboard=unnamed    " yank to system clipboard
set backupdir=/tmp      " don't clutter up current dir with tmp files
set directory=/tmp      " don't clutter up current dir with swap files

" load vim bundles using vundle
source ~/.vimrc.bundles

" set filetype stuff to on
syntax enable
filetype on
filetype plugin on
filetype indent on

" soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" silence the beep
set visualbell

" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" show the current mode
set showmode

" hide the mouse pointer while typing
set mousehide

" this is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
" 
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is
"      executed if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" when the page starts to scroll, keep the cursor 3 lines from the top and 3
" lines from the bottom
set scrolloff=3

" make the command-line completion better
set wildmenu

" set the textwidth to be 80 chars
set textwidth=80
set colorcolumn=+1

" get rid of the silly characters in window separators
set fillchars=""

" vertical diffs by default
set diffopt+=vertical

" Initial path seeding
set path=.

" syntax coloring lines that are too long just slows down the world
set synmaxcol=500

set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" ruby syntax highlighting for watchr scripts
autocmd BufRead,BufNewFile *.watchr set filetype=ruby
autocmd BufRead,BufNewFile *.god set filetype=ruby

autocmd BufRead,BufNewFile *.md setlocal linebreak nolist
autocmd FileType php setlocal shiftwidth=4 tabstop=4

" ---------- MAPPINGS ----------

nmap <leader>t :CtrlP<cr>

" turn off that stupid highlight search
nmap <silent> <leader>h :nohlsearch<cr>

" set text wrapping toggles
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,

" buffer commands
noremap <silent> <leader>bd :bd<CR>

" edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <leader>f :call RunCurrentSpecFile()<cr>
map <leader>s :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>

" toggle nerdtree
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" suspend
map <silent> <leader>z :suspend<cr>

" open in marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" preview in markdown
map <silent> <leader>p :MDP<cr>
let g:MarkdownPreviewAlwaysOpen = 1

" thanks to Gary Bernhardt
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" ---------- COLORS ------------

set t_Co=256
colorscheme vividchalk


" set color scheme
" if has("gui_running")
"     set guifont=Monaco:h16
"     set antialias
" 
"     colorscheme vividchalk
" 
"     if !exists("g:vimrcloaded")
"         winpos 0 0
"         if ! &diff
"             winsize 130 90
"         else
"             winsize 227 90
"         endif
"         let g:vimrcloaded = 1
"     endif
" endif
