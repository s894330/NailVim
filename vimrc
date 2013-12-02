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

"Add full file path to statusline
set statusline+=%F

"for taglist
let Tlist_Use_SingleClick = 1

"for NERDTree
let NERDTreeMouseMode = 3

"for trinity
nmap <F8>   :TrinityToggleAll<CR>
