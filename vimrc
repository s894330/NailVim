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
nnoremap <silent> <C-f> :cs find 6 
inoremap <silent> <C-f> <Esc>:cs find 6 
vnoremap <silent> <C-f> <Esc>:cs find 6 

"== text operation ==
"copy text
nnoremap <silent> <C-c> "+yy
inoremap <silent> <C-c> <Esc>"+yya
vnoremap <silent> <C-c> "+y
"select all test
nnoremap <silent> <C-a> ggvG
inoremap <silent> <C-a> <Esc>ggvG
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
inoremap <silent> <C-z> <Esc>ua<Left>
vnoremap <silent> <C-z> ua<Left>

"redo
inoremap <silent> <C-r> <Esc><C-r>a<Left>

"== text movement operation ==
"move cursor to the end
nnoremap <silent> <End><End> <End>a
nnoremap <silent> e <End>
inoremap <silent> <C-e> <End>
"move cursor to the home
nnoremap <silent> <Home><Home> <Home>a<Left>
nnoremap <silent> h <Home>
inoremap <silent> <C-h> <Home>
"enable enter in normal mode
nnoremap <silent> <Enter><Enter> a<Left><CR>
"enable backspace in normal mode
nnoremap <silent> <Backspace> a<Left><Backspace>
"enable space in normal mode
nnoremap <silent> w<Space> a<Left><Space>
"fast to file end
nnoremap <silent> bg Gzz
"maps f to first keyword
nnoremap <silent> f *ggnzz
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

"== format file operation ==
"toggle line number
nnoremap <silent> <C-n> :set invnumber<CR>
inoremap <silent> <C-n> <Esc>:set invnumber<CR>
"enable <tab> in normal mode
nnoremap <silent> <Tab> :><CR>
nnoremap <silent> <S-Tab> :<<CR>
inoremap <silent> <S-Tab> <Esc>:<<CR>a<Left>
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <

"== cursor movement =="
nnoremap <silent> i <Up> 
"can not mapping ctrl+i, the behavior of ctrl + i is the same as <tab>
"you can use <alt> + i instead
"inoremap <silent> <C-i> <Up>
nnoremap <silent> k <Down>
inoremap <silent> <C-k> <Down>
nnoremap <silent> j <Left>
inoremap <silent> <C-j> <Left>
nnoremap <silent> l <Right>
inoremap <silent> <C-l> <Right>
nnoremap <silent> u <PageUp>
inoremap <silent> <C-u> <PageUp>
nnoremap <silent> o <PageDown>
inoremap <silent> <C-o> <PageDown>

"== programming operation ==
"for toggleComment
nnoremap <silent> <C-b>       mZ:call ToggleComment_toggle()<CR>`Z
inoremap <silent> <C-b>       <Esc>mZ:call ToggleComment_toggle()<CR>`Za<Left>
vnoremap <silent> <C-b>       mZ:call ToggleComment_toggle()<CR>`Z
"folding
"nnoremap <silent> ff :ToggleFold<CR>
"format coding style
nnoremap <silent> ff :CodeFormat<CR>
"auto make and run
nnoremap <silent> <C-p> :w!<CR>:!clear && make && ./a.out<CR>
inoremap <silent> <C-p> <Esc>:w!<CR>:!clear && make && ./a.out<CR>
"auto close
inoremap { {<CR>}<Esc>ko
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap <C-w> /*<Space><Space>*/<Left><Left><Left>
nnoremap <C-w> i/*<Space><Space>*/<Left><Left><Left>
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

"set auto indent
set cindent

"load color scheme
set t_Co=256
colorscheme nail-color

"set highlight search matches
"set hlsearch

"shorten the key timeout time
set timeoutlen=300

"set fold method
"set foldmethod=marker
"set foldmarker={,}
"set nofoldenable

"expand tab in source code
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.java set shiftwidth=4 | set expandtab
"================================================

autocmd VimEnter * call OpenProject()
autocmd VimLeave * call CloseProject()

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
