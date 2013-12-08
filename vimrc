"Set mapleader
let mapleader = ","

"======  Set general hotkey  ====================
"save file
nnoremap <silent> <C-s> <Esc>:w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>a
"exit file without save
nnoremap <silent> <C-q> <Esc>:Bclose!<CR>
inoremap <silent> <C-q> <Esc>:Bclose!<CR>
"copy text
nnoremap <silent> <C-c> <Esc>"*yy
inoremap <silent> <C-c> <Esc>"*yy
vnoremap <silent> <C-c> "*y
"cut text
vnoremap <silent> <C-x> "*d
"past text
nnoremap <silent> <C-v> <Esc>"*p<Esc>
inoremap <silent> <C-v> <Esc>"*p<Esc>a<Left>
"delete one line text
nnoremap <silent> <C-d> <Esc>dd
inoremap <silent> <C-d> <Esc>dda
"reload file anyway
nnoremap <silent> <F5> <Esc>:e!<CR>
inoremap <silent> <F5> <Esc>:e!<CR>
"undo
nnoremap <silent> <C-z> <Esc>u
inoremap <silent> <C-z> <Esc>u
"redo
nnoremap <silent> <C-a> <C-R>
inoremap <silent> <C-a> <Esc><C-R>
"toggle line number
nnoremap <silent> <C-w> <Esc>:set invnumber<CR>
inoremap <silent> <C-w> <Esc>:set invnumber<CR>
"enable enter in normal mode
nnoremap <silent> <CR> <Esc>i<CR><Esc>
"enable backspace in normal mode
nnoremap <silent> <Backspace> <Esc>i<Backspace><Esc><Right>
"enable <tab> in normal mode
nnoremap <silent> <Tab> <Esc>:><CR>
nnoremap <silent> <S-Tab> <Esc>:<<CR>
inoremap <silent> <S-Tab> <Esc>:<<CR>i
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <
"enable shift+End=select
nnoremap <silent> <S-e> <Esc>v<End>
inoremap <silent> <S-e> <Esc><Right>v<End>
"find file
nnoremap <silent> <C-f> <Esc>:cs find 7 
inoremap <silent> <C-f> <Esc>:cs find 7 
"reload vimrc
nnoremap <silent> rr <Esc>:so $MYVIMRC<CR>
"auto make and run
nnoremap <silent> <C-k> <Esc>:w!<CR>:!clear && make && ./a.out<CR>
inoremap <silent> <C-k> <Esc>:w!<CR>:!clear && make && ./a.out<CR>
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
"set number

"Add full file path to statusline
set statusline+=%F

"set auto indent
set cindent

"load color scheme
colorscheme nail-color

"disable useless hotkey
map k <Left>
map l <Down>
map ; <Right>
map o <Up>
"================================================

" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

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
nnoremap <silent> <F8>   :TrinityToggleAll<CR>

"for command-t
nnoremap <silent> <Leader>t :CommandT<CR>
let g:CommandTCancelMap='<C-d>'
let g:CommandTMaxCachedDirectories=0
