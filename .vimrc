" setting
" Set character encoding to UFT-8.
set fenc=utf-8
" Don't create a backup file
set nobackup
" Do not create a swap file.
set noswapfile
" Automatically reread the file you are editing when it is changed.
set autoread
" Allow other files to be opened while buffers are being edited.
set hidden
" Display the command being entered in the status.
set showcmd
" Move to head of line.
inoremap <C-a> <C-o>^
" Move to end of line.
inoremap <C-e> <C-o>$
" Use the control key and hjkl to move between split windows.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
" No beep sound
set belloff=all
" Enable backspace, which suddenly stops working.
set backspace=indent,eol,start
" clipboard
set clipboard=unnamed
" Emacs like keybind
noremap <C-p> <Up>
noremap <C-n> <Down>
noremap <C-b> <Left>
noremap <C-f> <Right>
noremap <C-a> <HOME>
noremap <C-e> <END>
noremap <C-d> <Del>
noremap <C-h> <BS>
noremap <C-k> <Esc>D
noremap <C-u> <Esc>dd

noremap! <C-p> <Up>
noremap! <C-n> <Down>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <HOME>
noremap! <C-e> <END>
noremap! <C-d> <Del>
noremap! <C-h> <BS>
noremap! <C-k> <Esc>D
noremap! <C-u> <Esc>dd

" apparent system
" Display line numbers
set number
" Highlight the current line
set cursorline
" Highlight the current line (vertical)
set cursorcolumn
" Allow the cursor to move one character ahead of the end of the line.
set virtualedit=onemore
" Indent is smart indent
set smartindent
" Always show the status line
set laststatus=2
" Command line completion
set wildmode=list:longest
" Make it possible to move the display line when wrapping.
nnoremap j gj
nnoremap k gk
" Enabling syntax highlighting
syntax enable


" Tab system
" Make invisible characters visible (tabs will be displayed as "▸-")
set list listchars=tab:\▸\-
" Make the Tab character a half-width space.
set expandtab
" Display width of Tab characters other than at the beginning of a line (in spaces)
set tabstop=2
" Display width of the Tab character at the beginning of a line
set shiftwidth=2


" search system
" If the search string is in lowercase, the search is case-insensitive.
set ignorecase
" Distinguish between uppercase and lowercase letters in the search string.
set smartcase
" Hit the target strings sequentially when entering search strings.
set incsearch
" When searching, go to the end and go back to the beginning.
set wrapscan
" Highlight the first search term when you get to the end of the search.
set hlsearch
" Press ESC repeatedly to un-highlight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" color
colorscheme iceberg
set background=dark
