set nu
set ruler
set relativenumber
set nocp
set ignorecase
syntax on
syntax enable
set autoindent
set nowrap
set tabstop=4
set incsearch
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set hlsearch
set cursorline
set encoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:·
filetype plugin indent on

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

map <F5> :call Run()<CR>
func! Run()
        exec "w"
        if &filetype == "c"
                exec "!time g++ % -o %< && ./%<"
        elseif &filetype == "java"
                exec "!time javac %"
                exec "!time java %<"
        elseif &filetype == "python"
                exec "!time python3 %"
        elseif &filetype == "go"
                exec "!time go run % "
        endif
endfunc
if &term =~ '^xterm'
  " normal mode
  let &t_EI .= "\<Esc>[0 q"
  " insert mode
  let &t_SI .= "\<Esc>[6 q"
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  set mouse=a
endif