"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim Running Configuration                       "
"           Author: Siddharth Yadav <siddharth_yadav@outlook.com>       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" => Initializers {{{
"    Any initializers for plugin or functionality etc are under here
" ======================================================================

" Initialize Pathogen
call pathogen#infect()


" Initialize neocomplete
let g:neocomplete#enable_at_startup = 1

" }}}

" => General {{{
"    This is general purpose configuration
" ======================================================================

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Automatically reload files if change detected from other source
set autoread


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Search
" ===============

" Highlight search results
set hlsearch


" Make search act like search in modern browsers
set incsearch


" Case insensitive search
set ignorecase


" When searching try to be smart about cases
set smartcase


" Backup
" ===============

" Don't need backup files. We already use git or svn etc.
set nobackup
set nowritebackup
set noswapfile


" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Code Folding
" ===============

" Enable folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" Maximum 10 nested folds
set foldnestmax=10

" Fold based on indentation
set foldmethod=indent

" }}}

" => User Interface {{{
"    All config related to UI of vim
" ======================================================================


" Set 7 lines to the cursor
set so=7


" Turn on the WiLd menu
set wildmenu


" Ignore compiled files
set wildignore=*.o,*~,*.pyc


"Always show current position
set ruler


" Height of the command bar
set cmdheight=2


" Set Terminal Color to 256
" This helps when running vim in tmux
set term=screen-256color


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" Set relative line number
set relativenumber


" Better visual cue while editing
" Enabling line highlight & column highlight
set cursorline
set cursorcolumn

" }}}

" => Keymaps {{{
"    All the keymaps are defined here.
" ======================================================================

" save session
nnoremap <leader>s :mksession<CR>


" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


" Smash switch to Normal mode
inoremap jj <Esc>
vnoremap <Leader><Leader>j <Esc>


" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv


if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Tab manipulation
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


" Easily edit new line above or below the cursor
" Below cursor
inoremap <Leader>o <Esc>o
" Above cursor
inoremap <Leader>O <Esc>O


" highlight last inserted text
nnoremap gV `[v`]

" Unite
" ===============

nnoremap <Leader>uo :Unite file buffer<CR>
nnoremap <Leader>uf :Unite file<CR>
nnoremap <Leader>ub :Unite file<CR>


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" Code Folding
" ===============

" Space opens/closes folds
nnoremap <space> za


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>l <c-w>l
map <Leader>h <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" Better copy/paste to system clipboard
nnoremap <Leader>cy "+y
nnoremap <Leader>cyy "+yy
nnoremap <Leader>cp "+p
inoremap <Leader>cy "+y
inoremap <Leader>cyy "+yy
inoremap <Leader>cp "+p
vnoremap <Leader>cy "+y
vnoremap <Leader>cp "+p


" Open Ag.vim
nnoremap <Leader>a :Ag


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Better line scrolling
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>


" Better buffer manipulation, cuz we all need them
nnoremap <Leader>bl :buffers<CR>
nnoremap <Leader>bs :b 
nnoremap <Leader>bd :bd<CR>


" NERD Tree
" ===================

" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
nnoremap <Leader>f :NERDTreeToggle<CR>


" Gundo
" ==================

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" }}}

" => Plugins {{{
" This contains plugins specific configurations
" ============================================================================


" Vim Powerline
" ===============

" Note: I don't use this anymore
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2


" Vim Airline
" ===============

" Show airline all the time, by default it only shows when we create a split
set laststatus=2

" Enable better tabline extension
let g:airline#extensions#tabline#enabled = 1

" Enable virtual env extension for Airline
let g:airline#extensions#virtualenv#enabled = 1

" Use patched fonts in Airline
let g:airline_powerline_fonts = 1

" Change default theme
let g:airline_theme = "hybridline"


" CtrlP
" ===============

" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
nnoremap <C-P> :CtrlPBuffer<CR>

" Open files in new tabs rather than buffers
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],}


" Python Mode
" ===============

" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = "vnew"
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Jedi-Vim
" ===============

" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Syntastic
" ===============

" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/syntastic.git
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args="--ignore=E501,W601,F403,E128,F401,D100,D102"
let g:syntastic_cpp_compiler_options = ' -std=c++11'


" Tagbar
" ===============
nnoremap <F8> :TagbarToggle<CR>
inoremap <F8> :TagbarToggle<CR>
vnoremap <F8> :TagbarToggle<CR>


" Python Folding
" ===============

" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
" set nofoldenable


" Close all folds in this file and use marker for folding instead of
" indentation
" vim:foldmethod=marker:foldlevel=0
" }}}
