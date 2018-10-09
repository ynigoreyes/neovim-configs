" Ynigo Reyes
" This .vimrc includes plugins for basic Web development and my own shortcuts

call plug#begin('~/.vim/plugged')
  " Other Stuff

  Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_working_path_mode = 'ra'

  Plug 'sjl/badwolf'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'bronson/vim-trailing-whitespace'
  autocmd BufWritePost * :FixWhitespace

  " Tmux "
    Plug 'christoomey/vim-tmux-navigator'

  " More File Specifics"
  :filetype plugin on

  " JavaScript "
    Plug 'pangloss/vim-javascript'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'vim-syntastic/syntastic'
    Plug 'mxw/vim-jsx'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    let g:javascript_plugin_flow = 1
    let g:jsx_ext_required = 1
    let g:ale_linters = {'javascript': ['eslint']}

  " TypeScripts "
    Plug 'leafgarland/typescript-vim'
    Plug 'quramy/tsuquyomi'
    Plug 'ianks/vim-tsx'

  " React "
    Plug 'flowtype/vim-flow', { 'autoload': { 'filetypes': 'javascript'} }
    Plug 'mattn/emmet-vim'
    let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends': 'jsx',
      \      'quote_char': "'",
      \  },
      \  'typescript.tsx' : {
      \      'extends': 'jsx',
      \      'quote_char': "'",
      \  },
      \}

  " JavaScript Linting "
  " Asynchronous Lint Engine (ALE)
  let g:ale_linters = {
    \  'javascript': ['flow', 'eslint']
    \}

  let g:ale_fixers = {
    \  'javascript': ['eslint'],
    \}

  let g:ale_fix_on_save = 1

  highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
  highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

  let g:ale_sign_error = 'X' " could use emoji
  let g:ale_sign_warning = '?' " could use emoji
  let g:ale_statusline_format = ['X %d', '? %d', '']

  " %linter% is the name of the linter that provided the message
  " %s is the error or warning message
  let g:ale_echo_msg_format = '%linter%: %s'

  " Map keys to navigate between lines with errors and warnings.
  nnoremap <leader>an :ALENextWrap<cr>
  nnoremap <leader>ap :ALEPreviousWrap<cr>


  " Flow "
  let g:flow#autoclose = 1
  let g:flow#enable = 1

  " C/C+ "
  " Disabled by default
    Plug 'rip-rip/clang_complete'

    " This probably will not work anywhere else
    " You can fix this probably by curling a download and putting it in
    " usr/lib. You can grab this through (linux)brew
    let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"

    " Lets me use cmake and doxygen
      let  g:C_UseTool_cmake    = 'yes'
      let  g:C_UseTool_doxygen = 'yes'

 " Python
    Plug 'zchee/deoplete-jedi'
    let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

  " Makefile (must use 'makefile' in vim)
    autocmd BufRead,BufNewFile makefile set noexpandtab
    autocmd BufRead,BufNewFile makefile set tabstop=4

  " Markdown
    Plug 'iamcco/markdown-preview.vim'
    let g:mkdp_auto_start = 1
    let g:mkdp_auto_open = 1
    let g:mkdp_open_to_the_world = 1

call plug#end()

" Syntastic Options "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Deoplete "
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp=1
set completeopt-=preview
set encoding=utf-8
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" VimJavascript "
let g:javascript_plugin_jsdoc = 1

" Configs for NERDTree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

" Editor
  let mapleader = ","
  set ttyfast " Somehow makes vim faster "
  set hls is " Highlighted search "
  set backspace=indent,eol,start " Lets me use the backspace button "
  set path+=** " This lets me use :find "
  set wildmenu
  set relativenumber

  " Always using 2 spaces as tabs except in makefiles "
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2

  set showmatch
  set autoindent
  set fileformat=unix
  set number
  set ruler
  set nowrap

  syntax enable
  set updatetime=4000
  set nocompatible

  set encoding=utf-8

" KeyMaps - Normal Mode
  " Clear Search
  :nnoremap <leader>/ :noh<kEnter>
  " Search in src for a file
  :nnoremap <leader>e :e src/**/
  " Center searched text
  :nnoremap n nzz
  :nnoremap N Nzz
  " Center jump-scrolling
  :nnoremap <c-d> <c-d>zz
  :nnoremap <c-u> <c-u>zz
  " Use Double Space to save your work
  :nnoremap <Space><Space> :w<kEnter>
  " MultiCursor Keymappings Ctrl+v to select and Shift+I to edit it
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key = '<C-v>'
  let g:multi_cursor_next_key = '<C-v>'
  let g:multi_cursor_quit_key = '<Esc>'
  " Tabbing
  :nnoremap <Tab> >>
  :nnoremap <s-Tab> <<

" KeyMaps - Insert Mode
  :imap jj <Esc>
  " Auto Closing quotes and such
  :imap { {}<Left>
  :imap ( ()<Left>
  :inoremap [ []<Left>

  :colorscheme elflord
