"PLUG
call plug#begin('~/.config/nvim/plugged')
" Plug 'sickill/vim-monokai' " Sublime
Plug 'morhetz/gruvbox' " Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " the coc
Plug 'itchyny/lightline.vim' " Status Bar
Plug 'jiangmiao/auto-pairs' " Pairs []{}''...
Plug 'scrooloose/nerdcommenter' " Comments
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot' " One for all
Plug 'tpope/vim-fugitive' " this should be illegal
Plug 'majutsushi/tagbar'
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()


let mapleader=" " " Set the map leader to ,
" ---------------coc-----------------
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <leader>rn <Plug>(coc-rename)
" rename function/variable throughout the project
nnoremap <leader>prn :CocSearch <C-R>=expand("<cword>")<CR><CR>
let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'
" list with files
nnoremap <C-p> :CocList --number-select files<CR>
nnoremap <silent><leader>m :CocList marketplace<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Alt+m for documentation
nnoremap <silent> <A-m> :call <SID>show_documentation()<CR>
nnoremap <silent><C-n> :CocCommand explorer<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ---------barbar--------
nnoremap <silent><C-b> :TagbarToggle<CR>
nnoremap <silent><C-s> :BufferClose<CR>:call lightline#update()<CR>
nnoremap <silent><C-e> :BufferNext<CR>:call lightline#update()<CR>
nnoremap <silent><C-q> :BufferPrevious<CR>:call lightline#update()<CR>
nnoremap <silent><leader>1 :BufferGoto 1<CR>
nnoremap <silent><leader>2 :BufferGoto 2<CR>
nnoremap <silent><leader>3 :BufferGoto 3<CR>
nnoremap <silent><leader>4 :BufferGoto 4<CR>
nnoremap <silent><leader>5 :BufferGoto 5<CR>
nnoremap <silent><leader>6 :BufferGoto 6<CR>
nnoremap <silent><leader>7 :BufferGoto 7<CR>
nnoremap <silent><leader>8 :BufferGoto 8<CR>
nnoremap <silent><leader>9 :BufferLast<CR>

"------------lightline-------------
let g:lightline = {'colorscheme': 'deus'}
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'filename', 'modified', 'branch', 'git'] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.component_function = {'git': 'LightlineGitStatus',
            \ 'branch': 'LightlineGitBranch'}

function! LightlineGitStatus() abort
  let status = get(b:, 'coc_git_status', '')
  " return status
  return winwidth(0) > 80 ? status : ''
endfunction

function! LightlineGitBranch() abort
  let branch = get(g:, 'coc_git_status', '')
  " return branch
  return winwidth(0) > 80 ? branch : ''
endfunction
nnoremap ; :

set mouse+=a

"===== EDITOR =====
set nu " Enable line numbers
set relativenumber " Enable relative line numbers
set background=dark " Set the background theme to dark
colorscheme gruvbox " Set the colorscheme
set autoindent " Set code autoindentation
set cursorline " Highlight current line
set tabstop=4 " One TAB appears to be 4 spaces
set expandtab " don't use actual tab character (ctrl-v)
set shiftwidth=4 " indenting is 4 spaces
set autoindent " turns it on
set smartindent " does the right thing (mostly) in programs
set cindent " stricter rules for C programs
set splitbelow splitright " Splits open at the bottom and right
set noshowmode " Don't show the indicator in insert mode.
set completeopt=longest,menuone,noselect " Improve completion menu
set so=12
set clipboard=unnamed

" Set the backup/undo/swap files to be in /tmp
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set ruler " Always show current position
set ignorecase " Ignore case when searching
set smartcase " Smart Casing
set hlsearch " Highlight search results
set incsearch " Modern search
set showmatch " Show matching brackets when text indicator is over them
syntax enable " Enable syntax highlighting

" Set true colors
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

"Wildmode
set wildmenu
set wildmode=list:longest,full

" H and L navigate to start or end of line
nnoremap H ^
nnoremap L $

" J and K navigate to start or end of screen
nnoremap K H
nnoremap J L

nnoremap <C-J> J
nnoremap <F2> K

" Alt+Direction moves 6 spaces.
nnoremap <A-h> 5h
nnoremap <A-j> 5j
nnoremap <A-k> 5k
nnoremap <A-l> 5l
vnoremap <A-h> 5h
vnoremap <A-j> 5j
vnoremap <A-k> 5k
vnoremap <A-l> 5l

"===== KEY REMAPS =====

" General Maps
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
autocmd BufWritePre * %s/\s\+$//e " Strip trailing whitespace on file save
" Clipboard
vnoremap <C-c> "+y
nnoremap <A-v> "+p

" --------------coc session------------
augroup session
    autocmd!
    autocmd FileType * nnoremap <F6> :CocCommand session.load<CR>
    autocmd FileType * nnoremap <F7> :CocCommand session.save<CR>
    autocmd TermOpen term://* startinsert
    autocmd FocusGained * :checktime
    autocmd FileType vim nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
augroup END

augroup cc
    autocmd!
    autocmd FileType c,cpp nnoremap <F4> :w<CR> :16split term://make<CR>
    autocmd FileType c,cpp nnoremap <F5> :w<CR> :16split term://./%:r<CR>
augroup END

" ------------fugitive--------------
augroup git
    autocmd!
    autocmd FileType * nnoremap <F1> :Gwrite<CR>
    autocmd FileType * nnoremap <F2> :Gcommit -m ""<Left>
    autocmd FileType * nnoremap <Leader>gs :G<CR>
    autocmd FileType * nnoremap <Leader>gl :GcLog --stat<CR>
    "autocmd FileType * nnoremap <Leader>gp :Gpush<CR>
    autocmd FileType * nnoremap <Leader>gp :16split term://git push<CR>
augroup END
