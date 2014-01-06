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
inoremap <silent> <C-z> <Esc>ui
vnoremap <silent> <C-z> ui

"== text movement operation ==
"move cursor to the end
nnoremap <silent> <End><End> <End>a
"enable enter in normal mode
nnoremap <silent> <Enter><Enter> i<CR>
"enable backspace in normal mode
nnoremap <silent> <Backspace> i<Backspace>
"enable space in normal mode
nnoremap <silent> w<Space> i<Space>
"1~9 maps to 1~5 searched word, 6~0 maps to last searched word
nnoremap <silent> 1 *ggn
nnoremap <silent> 2 *ggnn
nnoremap <silent> 3 *ggnnn
nnoremap <silent> 4 *ggnnnn
nnoremap <silent> 5 *ggnnnnn

nnoremap <silent> 6 *GNNNNN
nnoremap <silent> 7 *GNNNN
nnoremap <silent> 8 *GNNN
nnoremap <silent> 9 *GNN
nnoremap <silent> 0 *GN

"== format file operation ==
"toggle line number
nnoremap <silent> <C-l> :set invnumber<CR>
inoremap <silent> <C-l> <Esc>:set invnumber<CR>
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
"folding
"nnoremap <silent> ff :ToggleFold<CR>
"format coding style
nnoremap <silent> ff :CodeFormat<CR>
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
set statusline=%F%m%r%h%w\%=row:%l/%L(%03p%%)\ col:%03v

"set auto indent
set cindent

"load color scheme
set t_Co=256
colorscheme nail-color

"highlight the line margin
"let &colorcolumn="81,".join(range(81,999),",")
set colorcolumn=81

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
