if exists("b:did_my_tex_ftplugin")
	finish
endif
let b:did_my_tex_ftplugin = 1

setlocal noautoindent

set spell
set noai nocin nosi inde=

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
    !make
  endif
endfunction

autocmd BufWritePost *.tex call ToggleRunOnSave()
map <F4> :call ToggleRunOnSave(1)<CR>

"------------------------------

call IMAP ("THELLO", "\\documentclass{article}\<cr>\\title{<++>}\<cr>\\author{<++>}\<cr>\\begin{document}\<cr>\\maketitle\<cr><++>\<cr>\\end{document}", "tex")

call IMAP ("eqq", "\\eqname~(\\ref{eqn:<++>})", "tex")
call IMAP ("fii", "\\figname~\\ref{fig:<++>}", "tex")
call IMAP ("taa", "\\tabname~\\ref{tab:<++>}", "tex")
call IMAP ("TAPP", "Appendix~(\\ref{<++>})", "tex")

call IMAP ("TIT", "\\begin{itemize}\<cr>\\item <++>\<cr>\\end{itemize}<++>", "tex")

"=========================================================================================== Begin

call IMAP ("TBIT", "\\begin{itemize}\<cr>\\item <++>\<cr>\\end{itemize}<++>", "tex")
call IMAP ("TBEG", "\\begin{<++>}\<cr>	<++>\<cr>\\end{<++>}<++>", "tex")

"=========================================================================================== Environments

" Equations
call IMAP ("TNEQ", "\\begin{equation*}\<cr><++>\<cr>\\end{equation*}", "tex")
call IMAP ("TEQ", "\\begin{equation}\<cr><++>\<cr>\\end{equation}", "tex")
call IMAP ("TALI", "\\begin{align}\<cr><++>\<cr>\\end{align}", "tex")
call IMAP ("TEA", "\\begin{equation} \\begin{aligned}\<cr>	<++>\<cr>\\end{aligned} \\end{equation}<++>", "tex")

" Table
call IMAP ("TTA", "\\begin{table} \centering\<cr>\\caption{}\<cr>\\begin{tabular}[c]{llllll} \\toprule\<cr>\\1 & 2 & 3 & 4 & 5 & 6 \\\\ \\hline\<cr>&   &   &   &   &   \\\\\<cr>\\bottomrule\<cr>\\end{tabular}\<cr>\\label{tab:}\<cr>\\end{table}", "tex")

" Verbatim
call IMAP ("TVE","\\begin{Verbatim}[samepage=true]\<cr><++>\<cr>\\end{Verbatim}\<cr>","tex")
call IMAP ("TLS","\\begin{lstlisting}\<cr><++>\<cr>\\end{lstlisting}\<cr><++>","tex")

" Figure
call IMAP ("TFI","\\begin{figure} \\centering\<cr>\\includegraphics[scale=1]{<++>}\<cr>\\caption{<++>}\<cr>\\label{fig:<++>}\<cr>\\end{figure}","tex")
call IMAP ("TPI","\\parpic{\\includegraphics[width=8cm]{<++>}}\<cr>{\<cr>	<++>\<cr>}<++>", "tex")
call IMAP ("TPP","\\piccaption{<++>}\<cr>\\parpic{\\includegraphics{<++>}}\<cr>{\<cr>	<++>\<cr>}<++>", "tex")

call IMAP ("TSLI", "
\\\begin{slide}{}\<cr>
\\\begin{itemize}[type=1]\<cr>
\\\item<1-> <++>\<cr>
\\\end{itemize}\<cr>
\\\end{slide}", "tex")
