"nail custom functions

" Avoid reloading
if exists('loaded_nail_custom')
    finish
endif
let loaded_nail_custom = 1

" ========  Global variables  ========
let g:trinity_on = 0
let g:fold_on = 0

" ========  User interfaces  ========
command! -nargs=0 -bar ExitAll
    \ call Nail_Exit_All()
    
command! -nargs=0 -bar ToggleFold
    \ call ToggleFold()

command! -nargs=0 -bar CodeFormat
    \ call CodeFormat()    

" ========  Functions  ========
function! Nail_trinity_toggle()
	if g:trinity_on == 0
		"echo "set trinity on to 1"
		let g:trinity_on = 1
	else
		"echo "set trinity on to 0"
		let g:trinity_on = 0
	endif
endfunction

function! Nail_Exit_All()
	if g:trinity_on == 0
		"echo "trinity windows not enable, exit directly"
		execute "q!"
	else
		"echo "trinity windows enabled, exit trinity first"
		call Trinity_Toggle()
		execute "q!"
	endif
endfunction

function! ResetCscope()
	cscope kill -1
	cscope add $PWD/cscope.out
endfunction

function! Echo()
endfunction

function! CheckProject()
	if filereadable($PWD . "/cscope.out")	" this is project directory	
		call Trinity_Toggle()
		normal! zz	" center the screen
		execute "set number"

		"Add full file path to statusline
		setlocal statusline=%F%m%r%h%w\%=row:%l/%L(%03p%%)\ col:%03v
		
		"highlight the line margin
		"let &colorcolumn="81,".join(range(81,999),",")
		setlocal colorcolumn=81		
	endif
endfunction

function! SaveVimSession()
	if filereadable($PWD . "/cscope.out")	" this is project directory
		if (!isdirectory($PWD . "/.vimSession"))
			call mkdir($PWD . "/.vimSession")
		endif
		execute "mksession! " . $PWD . "/.vimSession/Session.vim"
	endif
endfunction

function! LoadVimSession()
	if filereadable($PWD . "/cscope.out")	" this is project directory	
		if argc() == 0 && filereadable($PWD . "/.vimSession/Session.vim")
			execute "source " . $PWD . "/.vimSession/Session.vim"
		endif
	endif
endfunction

function! LoadCscope()  
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

function! ToggleFold()
	if g:fold_on == 0	"first time use
		let g:fold_on = 1
		normal! za	"enable fold
		normal! zR	"unfold all
		normal! za	"fold current		
	else
		normal! za
	endif
endfunction

function! CodeFormat()
	"get current line number
	let lineNum = line(".")

	"formatting
	if &filetype == 'c'
		exec "%! astyle --style=java --indent=spaces=4 --attach-namespaces --attach-classes --indent-preproc-define --indent-col1-comments --min-conditional-indent=0 --max-instatement-indent=40 --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --align-pointer=name --align-reference=name --remove-brackets --convert-tabs --close-templates --break-after-logical"
	elseif &filetype == 'cpp'	".h file will recognize to .cpp
		exec "%! astyle --style=java --indent=spaces=4 --attach-namespaces --attach-classes --indent-preproc-define --indent-col1-comments --min-conditional-indent=0 --max-instatement-indent=40 --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --align-pointer=name --align-reference=name --remove-brackets --convert-tabs --close-templates --break-after-logical"
    elseif &filetype == 'java'
		exec "%! astyle --style=java --indent=spaces=4 --attach-namespaces --attach-classes --indent-preproc-define --indent-col1-comments --min-conditional-indent=0 --max-instatement-indent=40 --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --align-pointer=name --align-reference=name --remove-brackets --convert-tabs --close-templates --break-after-logical"
    else 
		echo "not supported filetype: ".&filetype
    endif

    "return to original line
    exec lineNum
endfunction
