"nail custom functions

" Avoid reloading
if exists('loaded_nail_custom')
    finish
endif
let loaded_nail_custom = 1

" Global variables
let g:trinity_on = 0

" User interfaces
command! -nargs=0 -bar ExitAll
    \ call Nail_Exit_All()

" Functions
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
	cscope reset
endfunction

function! Echo()	
endfunction

function! CheckProject()
	if filereadable($PWD . "/cscope.out")	" this is project directory		
		call Trinity_Toggle()
		normal! zz	" center the screen		
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
