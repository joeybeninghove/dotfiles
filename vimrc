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
set clipboard=unnamed   " yank to system clipboard
set backupdir=/tmp      " don't clutter up current dir with tmp files
set directory=/tmp      " don't clutter up current dir with swap files
set wildignore+=*/.git/*,*/.DS_Store,*/node_modules,*/app/views/icons

" load vim bundles using vundle
source ~/.vimrc.plugs

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

" set the textwidth to be 120 chars
set textwidth=120
set colorcolumn=+1

" get rid of the silly characters in window separators
set fillchars=""

" vertical diffs by default
set diffopt+=vertical

" Initial path seeding
set path=.,**

" syntax coloring lines that are too long just slows down the world
set synmaxcol=500

" use old regex engine for faster syntax highlighting (in Ruby)
set re=1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" ruby syntax highlighting for watchr scripts
autocmd BufRead,BufNewFile *.watchr set filetype=ruby
autocmd BufRead,BufNewFile *.god set filetype=ruby
autocmd FileType php setlocal shiftwidth=4 tabstop=4

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" ---------- MAPPINGS ----------

" save current buffer by hitting esc twice
"map <Enter> :w<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nmap <leader>t :CtrlP<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$|log\|tmp|vendor|node_modules$',
  \ 'file': '\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

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

" rpsec shortcuts
map <leader>f :call RunCurrentSpecFile()<cr>
map <leader>s :call RunNearestSpec()<cr>
map <leader>l :call RunLastSpec()<cr>
map <leader>a :call RunAllSpecs()<cr>

" vim-test mappings
nnoremap <silent> <Leader>f :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

let test#strategy = "basic"

" let g:test#ruby#rspec#options = { \ 'suite':   '--tag ~slow', \}

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" emmet
let g:user_emmet_leader_key=","

" toggle nerdtree
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['node_modules', 'icons']
let NERDTreeWinSize=50

" configure ALE
let g:ale_linters = {
\   'ruby': ['standardrb'],
\   'eruby': [],
\   'javascript': ['eslint', 'prettier-standard'],
\   'css': ['stylelint'],
\}
let g:ale_fixers = {
\   'ruby': ['standardrb'],
\   'javascript': ['eslint', 'prettier-standard'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1

" configure pencil
augroup pencil
  autocmd!
  autocmd filetype markdown,mkd,liquid call pencil#init()
augroup END

" Pencil / Writing Controls {{{
  let g:pencil#wrapModeDefault = 'soft'
  let g:pencil#textwidth = 74
  let g:pencil#joinspaces = 0
  let g:pencil#cursorwrap = 1
  let g:pencil#conceallevel = 0
  let g:pencil#concealcursor = 'c'
  let g:pencil#softDetectSample = 20
  let g:pencil#softDetectThreshold = 130
" }}}

" suspend
map <silent> <leader>z :suspend<cr>

" toggle distraction-free writing
map <silent> <leader>g :Goyo<cr>

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

runtime macros/matchit.vim

" ---------- COLORS ------------
set t_Co=256
set background=dark
colorscheme vividchalk
hi Search cterm=NONE ctermfg=black ctermbg=darkyellow

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
