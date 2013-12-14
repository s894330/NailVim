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
