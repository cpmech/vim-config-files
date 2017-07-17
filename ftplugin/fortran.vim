if exists("b:did_fortran_ftplugin")
	finish
endif
let b:did_fortran_ftplugin = 1

let g:fortran_free_source=1
let g:fortran_have_tabs=1
let g:fortran_more_precise=1
let g:fortran_do_enddo=1

" Template: Write Terminal
call IMAP ("TPF","write(*,'(A,F8)') 'x = ', <++>", "fortran")
