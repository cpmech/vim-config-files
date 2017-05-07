if exists("b:did_fortran_ftplugin")
	finish
endif
let b:did_fortran_ftplugin = 1

" Template: comment"
call IMAP("TCO", "C dmp <++>", "fortran")

" Template: comment line"
call IMAP("TCL", "C dmp ##################################################################", "fortran")

" Template: Write Terminal
call IMAP ("TWT","write(6,100<++>) <++>\<cr> 100<++> format(<++>)", "fortran")

" Template: Write File
call IMAP ("TWF","write(66<++>,100<++>) <++>\<cr> 100<++> format(<++>)", "fortran")

" Template: open file"
call IMAP("TOF", "open(unit=66<++>,file=\"<++>\")", "fortran")

" Template: close file"
call IMAP("TCF", "close(66<++>)", "fortran")
