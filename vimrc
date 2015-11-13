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
"search and replace
nnoremap <silent> <C-g> :%s/
inoremap <silent> <C-g> <Esc>:%s/
vnoremap <silent> <C-g> <Esc>:%s/

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
"pageDown
nnoremap <silent> b <PageDown>
nnoremap <silent> bb <PageUp>

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
set foldmethod=marker
set foldmarker={,}
"set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
nnoremap <silent> ff :ToggleFold<CR>
nnoremap <silent> fg zR	"unfold all

"format coding style
"nnoremap <silent> ss :CodeFormat<CR>
nnoremap <silent> ss :CodeFormatLinuxStyle<CR>
"nnoremap <silent> ff :CodeFormatLinuxStyle<CR> (this conflit with folding feature)

"auto make and run
nnoremap <silent> <C-p> :w!<CR>:!clear && make && ./a.out<CR>
inoremap <silent> <C-p> <Esc>:w!<CR>:!clear && make && ./a.out<CR>

"auto close
inoremap ( ()<Left>
inoremap [ []<Left>
"inoremap < <><Left>
inoremap { {<CR>}<Esc>ko<TAB>
inoremap <C-w> /*<Space><Space>*/<Left><Left><Left>
nnoremap <C-w> i/*<Space><Space>*/<Left><Left><Left>

inoremap ' <Esc>:CheckSingleQuote<CR>a
inoremap " <Esc>:CheckDoubleQuote<CR>a
inoremap ) <Esc>:CheckLittleBracket<CR>a)
inoremap ] <Esc>:CheckMiddleBracket<CR>a]
inoremap ; <Esc>:CheckSemiColon<CR>a;
"inoremap > <Esc>:CheckArrowBracket<CR>a>

"reload cscope
nnoremap <silent> <F12> :ResetCscope<CR>
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

"auto comment
set formatoptions+=r

"expand tab in source code
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.java,*.xml set shiftwidth=4 | set expandtab
autocmd BufRead,BufNewFile *.java,*.xml set shiftwidth=4 | set expandtab
"autocmd BufRead,BufNewFile */kernel/*.c,*/kernel/*.h set shiftwidth=4 | set softtabstop=4 | set noexpandtab
autocmd BufRead,BufNewFile *.c,*.h,*.cpp set shiftwidth=4 | set softtabstop=4 | set noexpandtab

"set line 80 color
autocmd BufRead,BufNewFile * setlocal colorcolumn=80

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
nnoremap <silent> <F8>   :TrinityToggleAll<CR>:set invnumber<CR>

"for tab toggle
nnoremap <silent> <F7>   :TabToggle<CR>
inoremap <silent> <C-F7>   <ESC>:TabToggle<CR>a

