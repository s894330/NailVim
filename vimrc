"Set mapleader
"The <Leader> key is mapped to \ by default. So if you have a map of <Leader>t,
"you can execute it by default with \+t
let mapleader = ","

"====== General vim property  ===============
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
"set cindent

"load color scheme
set t_Co=256
colorscheme nail-color

"set highlight search matches
"set hlsearch

"shorten the key timeout time
set timeoutlen=300

"auto comment
"set formatoptions+=r

"show trailing whitespace:
":match ExtraWhitespace /\s\+$/

"====== autocmd  ======================
autocmd VimEnter * call OpenProject()
autocmd VimLeave * call CloseProject()

"Expand tab in source code
autocmd BufRead,BufNewFile *.py,*.java,*.xml
	\ set softtabstop=4
	\ | set shiftwidth=4
	\ | set expandtab
	\ | set autoindent

autocmd BufRead,BufNewFile *.php,*.htm,*.html,*.css
	\ set softtabstop=2
	\ | set shiftwidth=2
	\ | set expandtab
	\ | set autoindent

autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.cc
	\ set softtabstop=4
	\ | set shiftwidth=4
	\ | set noexpandtab
	\ | set cindent
	\ | set autoindent

"set line 80 color
autocmd BufRead,BufNewFile * setlocal colorcolumn=80

"======  Pathogen plugin load  ==============
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

"====== Plugins settings  ===================
" Taglist
let Tlist_Use_SingleClick = 1

" NERDTree
let NERDTreeMouseMode = 3

" jedi-vim
" disable docstring window to popup during completion
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "2"
let g:jedi#environment_path = "/opt/global_python_venv"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>s"
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "k"
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

" flake8
"let g:flake8_cmd="<flake8 bin path>"
let g:flake8_quickfix_height=3
" run the Flake8 check every time write a Python file
autocmd BufWritePost *.py call flake8#Flake8()

" localvimrc
let g:localvimrc_ask=0

"======  General hotkey  ====================
" if want the Alt mapping work, you must install the following plugin
" https://github.com/drmikehenry/vim-fixkey
"== file operation ==
"save file
nnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <Esc>:w<CR>

"exit file without save
nnoremap <silent> <C-q> :Bclose!<CR>
inoremap <silent> <C-q> <Esc>:Bclose!<CR>
nnoremap <silent> <A-q> :Bclose!<CR>
inoremap <silent> <A-q> <Esc>:Bclose!<CR>

"exit vi and discard all change
nnoremap <silent> <F2> :ExitAll<CR>
inoremap <silent> <F2> <Esc>:ExitAll<CR>

"reload file anyway
nnoremap <silent> <F5> :e!<CR>
inoremap <silent> <F5> <Esc>:e!<CR>

"== File navigate operation ==
"switch buffer
nnoremap <silent> <C-Right> :bn<CR>
inoremap <silent> <C-Right> <Esc>:bn<CR>
nnoremap <silent> <C-RightMouse> :bn<CR>
inoremap <silent> <C-RightMouse> <Esc>:bn<CR>
nnoremap <silent> <C-Left> :bp<CR>
inoremap <silent> <C-Left> <Esc>:bp<CR>
nnoremap <silent> <C-LeftMouse> :bp<CR>
inoremap <silent> <C-LeftMouse> <Esc>:bp<CR>
nnoremap <silent> <A-Right> :bn<CR>
inoremap <silent> <A-Right> <Esc>:bn<CR>
nnoremap <silent> <A-RightMouse> :bn<CR>
inoremap <silent> <A-RightMouse> <Esc>:bn<CR>
nnoremap <silent> <A-Left> :bp<CR>
inoremap <silent> <A-Left> <Esc>:bp<CR>
nnoremap <silent> <A-LeftMouse> :bp<CR>
inoremap <silent> <A-LeftMouse> <Esc>:bp<CR>

"find file
nnoremap <silent> <C-f> :cs find 6 
inoremap <silent> <C-f> <Esc>:cs find 6 
vnoremap <silent> <C-f> <Esc>:cs find 6

"search and replace
nnoremap <silent> <C-g> :%s/
inoremap <silent> <C-g> <Esc>:%s/
vnoremap <silent> <C-g> <Esc>:%s/

"create new file
nnoremap <silent> <C-n> :e 
nnoremap <silent> <A-n> :e 
"inoremap <silent> <C-n> <Esc>:e 

"create new folder
nnoremap <silent> <C-k> :! mkdir 
nnoremap <silent> <A-k> :! mkdir 

"execute shell command
nnoremap <silent> <A-e> :! 

"== Text operation ==
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

"== Text movement operation ==
"move cursor to the end
nnoremap <silent> <End><End> <End>a
nnoremap <silent> <A-j> <End>
inoremap <silent> <A-j> <End>

"move cursor to the home
nnoremap <silent> <Home><Home> <Home>a<Left>
nnoremap <silent> <A-f> <Home>
inoremap <silent> <A-f> <Home>

"move cursor to next line directly
inoremap <silent> <A-o> <End><CR>
inoremap <silent> <A-CR> <End><CR>

"enable enter in normal mode
"nnoremap <silent> <Enter><Enter> a<Left><CR>
"enable backspace in normal mode
"nnoremap <silent> <Backspace> a<Left><Backspace>
"enable space in normal mode
"nnoremap <silent> w<Space> a<Left><Space>

"fast to file end
nnoremap <silent> bb Gzz

"fast to file start
nnoremap <silent> gg 1G

"maps f to first keyword
nnoremap <silent> f *ggnzz
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

"pageDown
nnoremap <silent> b <PageDown>
nnoremap <silent> g <PageUp>

"keep indent when press <ESC> on empty line
inoremap <CR> <CR>x<BS>

"== Format file operation ==
"toggle line number
nnoremap <silent> <C-l> :set invnumber<CR>
inoremap <silent> <C-l> <Esc>:set invnumber<CR>a

"enable <tab> in normal mode
nnoremap <silent> <Tab> :><CR>
nnoremap <silent> <S-Tab> :<<CR>
inoremap <silent> <S-Tab> <Esc>:<<CR>a<Left>
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <

"== Programming operation ==
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
nnoremap <silent> <Space> zR	"unfold all

"format coding style
"nnoremap <silent> ss :CodeFormat<CR>
"nnoremap <silent> ss :CodeFormatLinuxStyle<CR>

"auto make and run
"nnoremap <silent> <C-p> :w!<CR>:!clear && make && ./a.out<CR>
"inoremap <silent> <C-p> <Esc>:w!<CR>:!clear && make && ./a.out<CR>

"auto close
inoremap ( ()<Left>
inoremap [ []<Left>
"inoremap < <><Left>
autocmd FileType c,cpp,java,php inoremap { {<CR>}<Esc>ko<TAB>
autocmd FileType python,html inoremap { {}<Left>

"comment
inoremap <C-w> /*<Space><Space>*/<Left><Left><Left>
nnoremap <C-w> i/*<Space><Space>*/<Left><Left><Left>
inoremap <A-w> {%<Space><Space>%}<Left><Left><Left>
nnoremap <A-w> {%<Space><Space>%}<Left><Left><Left>
inoremap <C-e> <!--<Space><Space>--><Left><Left><Left><Left>
nnoremap <C-e> i<!--<Space><Space>--><Left><Left><Left><Left>

inoremap ' <Esc>:CheckSingleQuote<CR>a
inoremap " <Esc>:CheckDoubleQuote<CR>a
inoremap ) <Esc>:CheckLittleBracket<CR>a)
inoremap ] <Esc>:CheckMiddleBracket<CR>a]
inoremap } <Esc>:CheckBigBracket<CR>a}
inoremap ; <Esc>:CheckSemiColon<CR>a;
"inoremap > <Esc>:CheckArrowBracket<CR>a>

"reload cscope
"nnoremap <silent> <F12> :ResetCscope<CR>

" Show trailing whitespace and spaces before a tab:
nnoremap <silent> <F4>   :match ExtraWhitespace /\s\+$/<CR>
inoremap <silent> <F4>   <ESC>:match ExtraWhitespace /\s\+$/<CR>a
nnoremap <silent> <F3>   :match<CR>
inoremap <silent> <F3>   <ESC>:match<CR>a

"for trinity
nnoremap <silent> <F8>   :TrinityToggleAll<CR>

"for tab toggle
"nnoremap <silent> <F7>   :TabToggle<CR>
"inoremap <silent> <C-F7>   <ESC>:TabToggle<CR>a

