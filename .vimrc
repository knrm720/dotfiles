" vimrc

" setting
syntax enable
" set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" 見た目系
set number           
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set ambiwidth=double

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
set list listchars=tab:\▸\-
set expandtab
set tabstop=2
set shiftwidth=2

" 検索系
set ignorecase 
set smartcase  
set incsearch  
set wrapscan   
set hlsearch   

" undo 永続化
silent !mkdir ~/.vim/undo -p >/dev/null 2>&1
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" 自動インデント
inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>

" insertモード時の移動
imap <C-b> <Left>
imap <C-f> <Right>

" To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/usr/local/opt/fzf

" vim-plug
" install vim-plug if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" auto install plugin
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tyru/caw.vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-jp/vimdoc-ja'
" colorschemes
Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'}

" colorscheme 
set background=dark
colorscheme gruvbox

" 日本版ヘルプを優先する
set helplang=ja,en

" Ctrl + e でエクスプローラー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" Ctr + K でコメントアウト
nmap <C-k> <Plug>(caw:hatpos:toggle)
vmap <C-k> <Plug>(caw:hatpos:toggle)
" gaでEA起動(e.g. =で揃える場合はga=)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

set ttimeoutlen=50 " モード変更遅延解消

let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

call plug#end()
 
