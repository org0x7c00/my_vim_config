set nocompatible              " be iMproved
set mouse=a
set backspace=indent,eol,start
set nu
"hi LineNr ctermbg=black
set noswapfile
" 恢复光标最后编辑位置
au BufWinLeave *.py,*.c,*.cpp,*.css,*.html,*.js,*php mkview
au BufWinEnter *.py,*.c,*.cpp,*.css,*.html,*.js,*php silent loadview

set cursorline
syntax on
set backspace=2
set shiftwidth=4
set tabstop=4
set shiftwidth=4
set completeopt=menu
:colorscheme ron
set cindent
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'  
Bundle 'scrooloose/syntastic'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tacahiroy/ctrlp-funky'
Bundle "scrooloose/nerdtree"
Bundle "nathanaelkane/vim-indent-guides"
""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
"set error or warning signs
let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'
"whether to show balloons
let g:syntastic_enable_balloons = 1
""""""""""""YCM""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
filetype plugin indent on
""""""""""""Indent Guides 缩进列对齐线"""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

""""""""NerdTree配置 control+e打开当前文件目录树"""""""""""""""
map <C-e> :NERDTreeToggle<CR>
map <leader>ee :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
""""""""""""""""""""""""""""""""""""""""""""""
