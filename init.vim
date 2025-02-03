 "Plugins

call plug#begin()
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/preservim/nerdtree' ", {'on': 'NERDTreeToggle'}
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/RRethy/nvim-base16' " Base16 Color Schemes
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'jiangmiao/auto-pairs'
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
" Plug 'https://github.com/preservim/tagbar', {'on': 'TagbarToggle'} " Tagbar for code navigation
Plug 'https://github.com/dkarter/bullets.vim'
" Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy Finder, Needs Silversearcher-ag for :Ag
" Plug 'https://github.com/junegunn/fzf'
" Plug 'https://github.com/glepnir/dashboard-nvim'
" Plug 'https://github.com/davidhalter/jedi-vim'
" Plug 'github/copilot.vim'
Plug 'https://github.com/mbbill/undotree'
" Plug 'https://github.com/numirias/semshi'
" Plug 'https://github.com/tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'folke/tokyonight.nvim'
Plug 'https://github.com/rose-pine/neovim'
" Plug 'chipsenkbeil/distant.nvim', {
" \ 'branch': 'v0.3',
" \ 'do': ':lua require("distant"):setup()'
" \ }
call plug#end()
			
" General Configuration
set number
set relativenumber
set mouse=a
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=UTF-8
set clipboard=unnamed
:colorscheme rose-pine-main
let g:airline_theme='iceberg'

" NERDTree Configuration

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python_highlight_all = 1

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :UndotreeToggle<CR>

" VIM AIRLINE CONFIGURATION

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text'
    \]

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Tagbar
" nmap <F8> :TagbarToggle<CR>
" coc settings 
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)

nmap <silent> ]g <Plug>(coc-diagnostic-next)

 " Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')



" Fvim settings 
if exists('g:fvim_loaded') 
	:FVimCursorSmoothMove v:true
	:FVimBackgroundComposition 'transparent'
	:FVimBackgroundOpacity 0.95
	:FVimCustomTitleBar v:true
	:FVimUIPopupMenu v:true
endif
