"Set mapleader
let mapleader = ","

"======  Set general hotkey  ====================
"== file operation ==
"save file
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>
"exit file without save
nnoremap <silent> <C-q> :Bclose!<CR>
inoremap <silent> <C-q> <Esc>:Bclose!<CR>
"exit vi and discard all change
nnoremap <silent> <F2> :ExitAll<CR>
inoremap <silent> <F2> <Esc>:ExitAll<CR>
"reload file anyway
nnoremap <silent> <F5> :e!<CR>
inoremap <silent> <F5> <Esc>:e!<CR>

"== file navigate operation ==
"switch buffer
nnoremap <silent> <C-Right> :bn<CR>
inoremap <silent> <C-Right> <Esc>:bn<CR>
nnoremap <silent> <C-Left> :bp<CR>
inoremap <silent> <C-Left> <Esc>:bp<CR>
"find file
nnoremap <silent> <C-f> :cs find 7 
inoremap <silent> <C-f> <Esc>:cs find 7 
vnoremap <silent> <C-f> <Esc>:cs find 7

"== text operation ==
"copy text
nnoremap <silent> <C-c> "+yy
inoremap <silent> <C-c> <Esc>"+yya
vnoremap <silent> <C-c> "+y
"cut text
vnoremap <silent> <C-x> "+d
"past text
nnoremap <silent> <C-v> "+p<Esc>
inoremap <silent> <C-v> <Esc>"+p<Esc>a
vnoremap <silent> <C-v> "+p
"delete one line text
nnoremap <silent> <C-d> dd
inoremap <silent> <C-d> <Esc>dda
"undo
nnoremap <silent> <C-z> u
inoremap <silent> <C-z> <Esc>ui
vnoremap <silent> <C-z> ui
"redo
nnoremap <silent> <C-a> <C-R>
inoremap <silent> <C-a> <Esc><C-R>
"enable ctrl+End=select
nnoremap <silent> <C-e> v<End>
inoremap <silent> <C-e> <Esc><Right>v<End>
"select word
nnoremap <silent> bb bvw<Left>

"== text movement operation ==
"move cursor to the end
nnoremap <silent> <End><End> <End>a
"enable enter in normal mode
nnoremap <silent> <Enter><Enter> i<CR>
"enable backspace in normal mode
nnoremap <silent> <Backspace> i<Backspace>
"enable space in normal mode
nnoremap <silent> w<Space> i<Space>
"1 maps to line head, 0 maps to line tail
nnoremap <silent> 1 0
nnoremap <silent> 0 $

"== format file operation ==
"toggle line number
nnoremap <silent> <C-w> :set invnumber<CR>
inoremap <silent> <C-w> <Esc>:set invnumber<CR>
"enable <tab> in normal mode
nnoremap <silent> <Tab> :><CR>
nnoremap <silent> <S-Tab> :<<CR>
inoremap <silent> <S-Tab> <Esc>:<<CR>i
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <

"== programming operation ==
"for toggleComment
nnoremap <silent> <C-b>       mZ:call ToggleComment_toggle()<CR>`Z
inoremap <silent> <C-b>       <Esc>mZ:call ToggleComment_toggle()<CR>`Zi
vnoremap <silent> <C-b>       mZ:call ToggleComment_toggle()<CR>`Z
"auto make and run
nnoremap <silent> <C-k> :w!<CR>:!clear && make && ./a.out<CR>
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
set statusline=%F

"set auto indent
set cindent

"load color scheme
set t_Co=256
colorscheme nail-color

"set highlight search matches
"set hlsearch

"expand tab in source code
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.java set shiftwidth=4 | set expandtab
"================================================

autocmd VimEnter * call LoadCscope()
autocmd VimEnter * call LoadVimSession()
autocmd VimEnter * call CheckProject()

autocmd VimLeave * call SaveVimSession()

"for pathogen.vim management
execute pathogen#infect()

"for taglist
filetype on

"for taglist
let Tlist_Use_SingleClick = 1

"for NERDTree
let NERDTreeMouseMode = 3

"for trinity
nnoremap <silent> <F8>   :TrinityToggleAll<CR>
