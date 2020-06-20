"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Modify from amix/vimrc Basic version
"
" Maintainer:
"   ctjoy
"
" Sections:
"    -> General
"    -> Vundle and Plugin
"    -> Plugin setup
"    -> Editing mappings
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Spell checking
"    -> Skeleton file setting
"    -> Copy and Paste setting 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=8192 " more history
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
set mouse+=a " enable mouse mode (scrolling, selection, etc)
" disable audible bell
set noerrorbells visualbell t_vb=
" unbind keys
map <C-a> <Nop>
packloadall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle and Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Plugin 'davidhalter/jedi-vim'
" Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'hdima/python-syntax'
"
" " Syntax color and indent
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'ap/vim-css-color'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim linghtline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" NERDTree Plugin
" open NERDTree the quick way
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
" if the only window left open then close it
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Ctrlp Plugin, ignore
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"
" EasyMotion Plugin, mapping
map <Space> <Plug>(easymotion-prefix)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" vim-gitgutter Plugin
set updatetime=100

" T-Comment Plugin, fast shortcut for commenting
map <leader>c <c-_><c-_>

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1
endif

" vim vista
nnoremap <Leader>tt :Vista!!<CR>
let g:vista#renderer#enable_icon = 0

" vim prettier
nmap <Leader>p <Plug>(Prettier)
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" vim jsx pretty work with vim javascript
let g:vim_jsx_pretty_colorful_config = 1 " default 0

" vim python black formatter
nnoremap <Leader>b :Black<CR>
"auto format when close the file
autocmd BufWritePre *.py execute ':Black' 
let g:black_linelength = 120

" " python-syntax Plugin
" let python_highlight_all = 1
"
" " vim python jedi
" let g:jedi#usages_command = ""

" " vim syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"     \ 'mode': 'passive',
"     \ 'active_filetypes': [],
"     \ 'passive_filetypes': []
" \}
" nnoremap <Leader>s :SyntasticCheck<CR>
" nnoremap <Leader>r :SyntasticReset<CR>
" nnoremap <Leader>i :SyntasticInfo<CR>
" nnoremap <Leader>m :SyntasticToggleMode<CR>
" vim syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" let g:syntastic_python_checkers = ['pylint']
"
" highlight link SyntasticError ErrorMsg
" highlight link SyntasticErrorSign WarningMsg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 9 $
map 0 ^
imap jk <Esc>
" nmap <space> :
nmap <CR> o<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " highlight search
set incsearch " incremental search (as string is being typed)
set showmatch " show matching braces when text indicator is over them
set number " number lines
set relativenumber " relative line numbering
set clipboard=unnamed
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" smart case-sensitive search
set ignorecase
set smartcase

set ruler " show current position in file
set scrolloff=5 " show lines above and below cursor (when possible)
set lazyredraw " skip redrawing screen in some cases
" set cursorline
" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set encoding=utf8
" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
  set background=dark
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
endif

" Use Unix as the standard file type
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set autoindent
set smartindent
set backspace=indent,eol,start " allow backspacing over everything
set nojoinspaces " suppress inserting two spaces between sentences
set smarttab
set expandtab
set fileformat=unix

" use 2 spaces instead of tabs during formatting
set tabstop=2
set softtabstop=2
set shiftwidth=2

" use 4 spaces instead of tabs during formating when using python
autocmd BufNewFile,BufRead *.py call SetPythonFileIndent()
function SetPythonFileIndent()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

" Linebreak on 500 characters
set linebreak
set textwidth=500
set wrap

" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu

" mark extra whitespace as bad, and color it red.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"Remove all trailing whitespace by pressing leader dw
"Credit http://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
nnoremap <leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around  window fast
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" solution 1 solution 1 Buffer solution from Josh Davis solution 1 solution 1
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<cr>
" Tab to next buffer
nnoremap <tab> :bnext<cr>
" Shift-tab to previous buffer
nnoremap <s-tab> :bprevious<cr>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

set autochdir " automatically set current directory to directory of last opened file
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" ]s go to the next spell mistake
" [s go to the previous spell mistake
" zg add the new word to the spell file
" z= choice one of the option
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Skeleton file setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile *.html 0r ~/.vim/skeleton/skeleton.html | let IndentStyle = "html"
au BufNewFile *.sh 0r ~/.vim/skeleton/skeleton.sh | let IndentStyle = "sh"
au BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py | let IndentStyle = "py"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy and Paste setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy and paste to another program
vnoremap <leader>y "+y
map <leader>p "+P
