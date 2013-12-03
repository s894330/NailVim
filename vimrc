"Set mapleader
let mapleader = ","

"Set hotkey
"Esc+s:save file
map <silent> <Esc>s :w<cr>
"Esc+q:quit file without save
map <silent> <Esc>q :Bclose!<cr>
"Fast editing of .vimrc
map <silent> <Esc>e :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"for pathogen.vim management
execute pathogen#infect()

"for taglist
filetype on

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
nmap <F8>   :TrinityToggleAll<CR>

"for command-t
nnoremap <silent> <Leader>t :CommandT<CR>
let g:CommandTCancelMap='<C-d>'
let g:CommandTMaxCachedDirectories=0
