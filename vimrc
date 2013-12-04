"Set mapleader
let mapleader = ","

"======  Set general hotkey  ====================
"save file
noremap <silent> <C-s> <Esc>:w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>a
"exit file without save
noremap <silent> <C-q> <Esc>:Bclose!<CR>
inoremap <silent> <C-q> <Esc>:Bclose!<CR>
"undo
noremap <silent> <C-z> <Esc>u
inoremap <silent> <C-z> <Esc>ua
"redo
noremap <silent> <C-a> <C-r>
inoremap <silent> <C-a> <Esc><C-r>a
"toggle line number
noremap <silent> <C-x> <Esc>:set invnumber<CR>
inoremap <silent> <C-x> <Esc>:set invnumber<CR>a
"================================================

"====== Set general vim property  ===============
"enable mouse usage
"n: Normal mode
"v: Visual mode
"i: Insert mode
"c: Command-line mode
"a: All mode
set mouse=a

"display line number
set number

"Add full file path to statusline
set statusline+=%F

"set auto indent
set cindent

"disable useless hotkey
"map j <Left>
map k <Left>
map l <Down>
map ; <Right>
map o <Up>
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
