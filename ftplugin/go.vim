if exists("b:did_my_go_ftplugin")
	finish
endif
let b:did_my_go_ftplugin = 1

"--- run on save ---------------------------

let g:toggleRunOnSave = 0
function! ToggleRunOnSave(...)
  if a:0 == 1 "do toggle behaviour
    let g:toggleRunOnSave = 1 - g:toggleRunOnSave
    return
  endif
  if g:toggleRunOnSave == 0
    "do nothing
  else
    !go run %
  endif
endfunction

autocmd BufWritePost *.go call ToggleRunOnSave()
map <F4> :call ToggleRunOnSave(1)<CR>

"------------------------------

call IMAP ("TFOR","for <++>, <++> := range <++> {\<cr><++>\<cr>}","go")
call IMAP ("TFOI","for i := 0; i < <++>; i++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOJ","for j := 0; j < <++>; j++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOK","for k := 0; k < <++>; k++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOL","for l := 0; l < <++>; l++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOM","for m := 0; m < <++>; m++ {\<cr><++>\<cr>}","go")
call IMAP ("TFON","for n := 0; n < <++>; n++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOD","for d := 0; d < <++>; d++ {\<cr><++>\<cr>}","go")
call IMAP ("TFOE","for e := 0; e < <++>; e++ {\<cr><++>\<cr>}","go")
call IMAP ("TPF","io.Pforan(\"<++> = %v\\n\", <++>)","go")
call IMAP ("TQF","io.Pfblue2(\"<++> = %v\\n\", <++>)","go")
call IMAP ("TWF","io.Pf(\"<++> = %v\\n\", <++>)","go")
call IMAP ("THELLO","// Copyright 2012 Dorival de Moraes Pedroso. All rights reserved.\<cr>// Use of this source code is governed by a BSD-style\<cr>// license that can be found in the LICENSE file.\<cr>\<cr>package main\<cr>\<cr>import \(\<cr>\"fmt\"\<cr>\)\<cr>\<cr>func main\(\) {\<cr>fmt.Printf\(\"Hello\\n\"\)\<cr><++>\<cr>}", "go")
call IMAP ("TER","if err != nil {\<cr><++>\<cr>}", "go")
call IMAP ("TPE","if err != nil {\<cr>io.Panic\(\"<++>:\\n%v\", err\)\<cr>}", "go")
call IMAP ("TTE","if err != nil {\<cr>tst.Errorf(\"test failed: %v\\n\", err)\<cr>return\<cr>}\<cr><++>", "go")
call IMAP ("TMA","make([]float64, <++>)", "go")
call IMAP ("TLOG","io.Pf(\"%v\\n\", <++>)","go")
call IMAP ("TUF","(*C.double)(unsafe.Pointer(&<++>[0]))", "go")
call IMAP ("TUL","(*C.long)(unsafe.Pointer(&<++>[0]))", "go")
call IMAP ("T{F","[]float64{<++>}","go")
call IMAP ("T{I","[]int{<++>}","go")
call IMAP ("TGM","Y := utl.GetMapped(X, func(x float64) float64 { return <++> })","go")
call IMAP ("TPL","plt.Reset(true, &plt.A{WidthPt: 400, Dpi: 150})\<cr>plt.Plot(X, Y, &plt.A{C: \"b\", Ls: \"-\", L: \"curve1\", NoClip: true})\<cr>plt.Gll(\"x\", \"y\", nil)\<cr>plt.HideTRborders()\<cr>plt.Save(\"/tmp/gosl\", \"myplot01\")","go")

"setlocal omnifunc=gocomplete#Complete
