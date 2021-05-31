
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set ignorecase
:set omnifunc=htmlcomplete " HTML tag completion

" leader key
let mapleader=","



call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'jiangmiao/auto-pairs' " Automatic closing
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/preservim/tagbar' " Tagbar (works with ctags)
Plug 'ap/vim-buftabline' " Buffer managers
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/arcticicestudio/nord-vim' "Color scheme
Plug 'https://github.com/mattn/emmet-vim' " Emmet for vim
Plug 'alvan/vim-closetag' " Closing tags for HTML
Plug 'pangloss/vim-javascript' " Support for javascript
Plug 'maxmellon/vim-jsx-pretty' " Support for jsx
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy find
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Support for golang

set encoding=UTF-8
set hidden
set updatetime=500


call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
"nnoremap <C-p> :GFiles <CR>
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
nnoremap <C-/> :KiteFindRelatedCodeFromFile <CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-reference)
nmap <leader>t :TagbarToggle<CR>



" autocmplete setup
:set completeopt-=menu
:set completeopt-=preview " For No Previews
:set completeopt+=menuone
:set completeopt+=noinsert
:set completeopt-=longest
:set completeopt-=noselect





"allow coc.nvim to load only for the specified filetypes
let g:my_coc_file_types = ['py']

function! s:disable_coc_for_type()
	if index(g:my_coc_file_types, &filetype) == -1
	        let b:coc_enabled = 0
	endif
endfunction

augroup CocGroup
	autocmd!
	autocmd BufNew,BufEnter * call s:disable_coc_for_type()
augroup end

" nerd tree and emmet 
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:user_emmet_mode="n"
let g:user_emmet_leader_key =","


set guifont=JetBrainsMono\ Nerd\ Font\ 14
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" 260 colors
set t_Co=256
set t_ut=


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"`
