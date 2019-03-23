" Ynigo Reyes

let mapleader = ","

" Vim Plug
call plug#begin('~/.vim/plugged')

  " Global Plugins
  Plug 'drewtempelmeyer/palenight.vim'
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
  Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_working_path_mode = 'ra'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-fugitive'
  Plug 'sebdah/vim-delve'

  " Tmux "
  Plug 'christoomey/vim-tmux-navigator'

  " Golang Config
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  let g:go_auto_sameids = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  let g:go_fmt_command = "goimports"
  " Error and warning signs.
  let g:ale_sign_error = '⤫'
  let g:ale_sign_warning = '⚠'
  " Enable integration with airline.
  let g:airline#extensions#ale#enabled = 1
  let g:go_auto_type_info = 1
  " Go To definition
  au FileType go nmap <F12> <Plug>(go-def)
  if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
  endif
  " Disable deoplete when in multi cursor mode
  function! Multiple_cursors_before()
      let b:deoplete_disable_auto_complete = 1
  endfunction
  function! Multiple_cursors_after()
      let b:deoplete_disable_auto_complete = 0
  endfunction
  let g:go_addtags_transform = "snakecase"

  " JavaScript Config
  Plug 'pangloss/vim-javascript'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'mxw/vim-jsx'
  let g:javascript_plugin_flow = 1
  let g:jsx_ext_required = 0
  let g:ale_linters = {'javascript': ['eslint']}
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs'

  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#enable_refresh_always = 1
  let g:deoplete#max_abbr_width = 0
  let g:deoplete#max_menu_width = 0
  let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
  let g:tern_request_timeout = 1
  let g:tern_request_timeout = 6000
  let g:tern#command = ['tern']
  let g:tern#arguments = [' — persistent']

  set completeopt-=preview
  set encoding=utf-8

  " TypeScripts Config
  Plug 'leafgarland/typescript-vim'
  Plug 'quramy/tsuquyomi'
  Plug 'ianks/vim-tsx'

  " React Config
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

  " JavaScript Linting (ALE)
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

  " Flow Config
  let g:flow#autoclose = 1
  let g:flow#enable = 1

  " C/C+ Config
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
  autocmd BufRead,BufNewFile make set noexpandtab
  autocmd BufRead,BufNewFile make set tabstop=4
  autocmd BufRead,BufNewFile make set softtabstop=4
  autocmd BufRead,BufNewFile make set shiftwidth=4

  " Markdown Configs
  Plug 'iamcco/markdown-preview.vim'
  let g:mkdp_auto_start = 1
  let g:mkdp_auto_open = 1
  let g:mkdp_open_to_the_world = 1

call plug#end()

" Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" VimJavascript
let g:javascript_plugin_jsdoc = 1

" NERDTree Configs
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

" Editor Configs
  :filetype plugin on
  set relativenumber
  set ttyfast " Somehow makes vim faster "
  set hls is " Highlighted search "
  set backspace=indent,eol,start " Lets me use the backspace button "
  autocmd BufWritePost * :FixWhitespace

  " Theme
  " set background=dark
  colorscheme palenight
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif

  let g:palenight_terminal_italics=1

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

" Misc Options
  set path+=** " This lets me use :find "
  set wildmenu
  augroup AutoSaveFolds
  autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
  augroup END


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
  :nnoremap <leader><Tab> >>
  :nnoremap <leader><s-Tab> <<
  " Tagbar
  :nnoremap <F8> :TagbarToggle<CR>

" KeyMaps - Insert Mode
  :imap jj <Esc>
  " Auto Closing quotes and such
  :imap { {}<Left>
  :imap ( ()<Left>
  :inoremap [ []<Left>
