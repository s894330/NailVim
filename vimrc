"Set mapleader
let mapleader = ","

"======  Set general hotkey  ====================
"Esc+z:save file
map <silent> <Esc>z :w<cr>
"Esc+x:save file and exit
map <silent> <Esc>x :Bclose<cr>
"Esc+q:quit file without save
map <silent> <Esc>q :Bclose!<cr>
"Fast editing of .vimrc
map <silent> <Esc>e :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
"================================================

"====== Set general vim property  ===============
"enable mouse usage
"n: Normal mode
"v: Visual mode
"i: Insert mode
"c: Command-line mode
"a: All mode
set mouse=n

"display line number
set number

"Add full file path to statusline
set statusline+=%F

"set ignorecase when search
set ignorecase

"set auto indent
set cindent

map j <Left>
map k <Down>
map l <Right>
map i <Up>

"imap <C-s> <Esc>
" If the current buffer has never been saved, it will have no name,
	" call the file browser to save it, otherwise just save it.
"command -nargs=0 -bar Update if &modified
"		\|    if empty(bufname('%'))
"		\|        browse confirm write
"		\|    else
"		\|        confirm write
"		\|    endif
"		\|endif
inoremap <silent> <C-s> <Esc>:w<CR>a

"================================================

"for pathogen.vim management
execute pathogen#infect()

"for taglist
filetype on

"for cscope database connect
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"for taglist
let Tlist_Use_SingleClick = 1

"for NERDTree
let NERDTreeMouseMode = 3

"for trinity
nnoremap <F8>   :TrinityToggleAll<CR>

"for command-t
nnoremap <silent> <Leader>t :CommandT<CR>
let g:CommandTCancelMap='<C-d>'
let g:CommandTMaxCachedDirectories=0
