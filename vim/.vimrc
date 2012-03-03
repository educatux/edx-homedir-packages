" mode non compatible avec vi
set nocompatible

" ftplugin
" Ftplugin permet d'associer à chaque type de fichier ouvert une configuration
" particulière. Par exemple, pour des règles spécifiques à python, il suffit
" de mettre ces règles dans ~/.vim/ftplugin/python.vim
" Enable filetype plugin
filetype plugin on
filetype indent on

" On active la coloration syntaxique
syntax on
set hlsearch

" Force le support de 256 couleurs
set t_Co=256
set background=dark

" Theme
colorscheme xoria256
"colorscheme evening
"colorscheme vividchalk
"colorscheme desert256

" Enregistre le fichier en tant que root avec :wr
cab wr w !sudo tee %

" Raccourcis clavier
map <F2> <ESC>:w<CR>
map <F3> <ESC>:set nu!<CR>
" map <F4> <ESC>:q!<CR>
map <F10> <ESC>:wr<CR>
" map <F9> <ESC>:TagbarToggle<CR>
map <F8> <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" Encodage par défaut
set encoding=utf-8

" Fonts par defaut pour gvim
if has('gui_running')
    set guifont=Monaco\ Bold\ 10
endif

" Replis
"set fdc=2
"set fdm=indent

" On vérifie automatiquement les parenthèses
set sm!

" Numérotation des lignes
" set nu!

" Utilisation de la souris
" set mouse=a
behave xterm

" Active le mode sélection
"set selectmode+=mouse

" Autoindentation
set cindent
set autoindent

" La touche TAB est remplacée par 4 espaces
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=0

" Permet d'utiliser la touche backspace pour effacer du texte
set bs=2

autocmd BufRead *.aft set fileencoding=ISO-8859-15 noexpandtab
autocmd BufNewFile,BufRead,BufEnter,BufWrite *.rst set fileencoding=utf8 spell spelllang=fr
autocmd BufWritePre * %s/\s\+$//e

" Chargement de PathoGen
call pathogen#infect()

" ## NERDTree
let g:NERDTreeDirArrows = 1 " use arrows for the tree structure
" let g:NERDChristmasTree = 0 " less colorful tree
" let g:NERDTreeHighlightCursorline = 0 " no cursor highlight in the tree
" let g:NERDTreeMouseMode = 3 " one click will open the (and files)
let g:NERDTreeWinPos = 'left' " display the NERDTree on the right
let g:NERDTreeWinSize =90 " the width of the NERDTree when it opens

let g:tagbar_usearrows = 1

" let g:SuperTabDefaultCompletionType = "context"


" nnoremap <leader>l :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


let MRU_Max_Entries = 40
" map <leader>f :MRU<CR>

" When vimrc is edited, reload it
" autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Set to auto read when a file is changed from the outside
set autoread

set nobackup
set nowb
set noswapfile

