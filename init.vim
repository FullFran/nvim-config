" Configuración para crear una IDE para python. 

" Configuraciones básicas de nvim:
  set number   " añade números de línea
  set mouse=a " permite usar el ratón
  set numberwidth=1 " la anchura de los números de línea
  set clipboard=unnamed " permite leer el clipboar del 	OS
  syntax enable  " resaltado de sintaxis
  set showcmd   " muestra los comandos
  set ruler
  set encoding=utf-8
  set showmatch  " resalta los paréntesis de cerrado y abierto al ponerte encima
  set sw=2
  set relativenumber " Activa los relative numbers en los números de línea.
  set laststatus=2
" Enable folding
  set foldmethod=indent
  set foldlevel=99


" Llamamos a los plugins utilizando plug
  call plug#begin('~/AppData/Local/nvim/plugged')

  " Temas
    Plug 'morhetz/gruvbox'
  

  " de Hola Mundo
    " syntax
      Plug 'sheerun/vim-polyglot'

    " status bar
      Plug 'maximbaz/lightline-ale'
      Plug 'itchyny/lightline.vim'
    " Typing
      Plug 'jiangmiao/auto-pairs'
      "Plug 'alvan/vim-closetag' " Para cerrar etiquetas
      Plug 'tpope/vim-surround'  " Para envolver variables y demás
    " Autocompletado 
      " Pluging de snipets muy potente
      "Plug 'VirVer/ultisnips'
      Plug 'neoclide/coc.nvim', {'branch': 'release'} "Muy potente de
      "autocompletado pero prefiere kite para python python.
    " ide
      Plug 'junegunn/fzf'   " buscador de archivos y más para vim
      Plug 'junegunn/fzf.vim'
      Plug 'mhinz/vim-signify'   " Añade signos para mostrar cambios
      Plug 'yggdroot/indentline' " Añade línea para marcar la identación. 
      Plug 'scrooloose/nerdcommenter'  " Para comentar de forma sencilla
      Plug 'tpope/vim-repeat'  " Para repetir con . acciones no nativas de vim. (contempla surround)
      


  "IDE 
      Plug 'easymotion/vim-easymotion' " easy motion
      Plug 'scrooloose/nerdtree'		" barra lateral de ficheros
      Plug 'christoomey/vim-tmux-navigator' " para movernos por los splits con ctr flechas hjkl
      Plug 'tmhedberg/SimpylFold'           " mejora el fold basado en indentado.
    
      " Python
	"Plug 'Valloric/YouCompleteMe'   " Autocompletacion
  " Snippets:
  "   Plug 'Sirver/ultisnips'
    "Plug 'SirVer/ultisnips'
  "   Plug 'honza/vim-snippets'
   "Plug 'honza/vim-snippets'
  " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
  " - https://github.com/Valloric/YouCompleteMe
  " - https://github.com/nvim-lua/completion-nvim
  "let g:UltiSnipsExpandTrigger="<c-Space>"
  "let g:UltiSnipsJumpForwardTrigger="<c-k>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-j>"
  " If you want :UltiSnipsEdit to split your window.
  "let g:UltiSnipsEditSplit="vertical"



  call plug#end()


let g:python3_host_prog = 'C:\Python312'
"snippets.ultisnips.enable": false
  " Empezamos con atajos de teclado.

let mapleader=" " " mapeamos el Leader a espacio.

let g:SimpylFold_docstring_preview=1

" Usar easymotion con espacio s
nmap <Leader>s <Plug>(easymotion-s2)
" abrir la barra de archivos con espacio nt
nmap <Leader>nt :NERDTreeFind<CR>  
let g:NERDTreeWinPos = "right"     " abrir barra lateral de archivos 
let NERDTreeQuitOnOpen=1           " que se cierre el nerdtree automaticamente




" Atajos personalizados
  " Guardar y cerrar con <Leader> en vez de :
    nmap <Leader>w :w<CR>
    nmap <Leader>q :q<CR>
  " folding con <leader>f
    nnoremap <leader>f za 
  " Modo normal en terminal con Esc
    :tnoremap <Esc> <C-\><C-n>

  
" IDE para python
  set autoindent




" Mapeos de Hola mundo 
  " split resize con espacio >< y +-
    nnoremap <Leader>> 10<C-w>>
    nnoremap <Leader>< 10<C-w><
    nnoremap <Leader>+ 10<C-w>+
    nnoremap <Leader>- 10<C-w>-

  " plugins
    " Buscar files
    map <Leader>p :Files<CR>
    " buscar cadena de texto dentro de los archivos
    map <Leader>ag :Ag<CR>

  " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation) 
    nmap <silent> gr <Plug>(coc-references) 
  " Tabs navigation
    map <Leader>h :tabprevius<cr>
    map <Leader>l :tabnext<cr>

  " buffers
    map <Leader>ob :Buffers<cr>


  " faster scrolling
  " nnoremap <C-j> 10<C-e>
  " nnoremap <C-k> 10<C-y>

  " run current file
  nnoremap <Leader>x :w<CR>:!python3 %<cr>


  " autocompletado con Tab " Habilitar autocompletado de CoC con Tab GPt
  inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

  " Habilitar autocompletado de CoC con Enter
  " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
  


  " Abrir terminal Hola Mundo:
  
  set splitright
  function! OpenTerminal()
    "move to right most buffer
    execute "normal \<C-l>"
    execute "normal \<C-l>"
    execute "normal \<C-l>"
    execute "normal \<C-l>"

    let bufNum = bufnr("%")
    let bufType = getbufvar(bufNum, "&buftype", "not found")

    if bufType == "terminal"
      " close existing terminal
      execute "q"
    else 
      " open terminal
      execute "vsp term://pwsh"
      " turn off numbers
      execute "set nonu"
      execute "set nonu"

      " toggle insert on enter/exit
      silent au BufLeave <buffer> stopinsert!
      silent au BufWinEnter,WinEnter <buffer> startinsert!

      " set maps inside terminal buffer
      execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
      execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
      execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

      startinsert!
    endif
  endfunction
  nnoremap <C-t> :call OpenTerminal()<CR>
