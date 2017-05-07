if exists("b:did_my_html_ftplugin")
	finish
endif
let b:did_my_html_ftplugin = 1

set tabstop=4
set shiftwidth=4
set expandtab

call IMAP ("THELLO", "<!doctype html>\<cr><html>\<cr><head>\<cr><title><++></title>\<cr><meta charset=\"utf-8\">\<cr></head>\<cr><body>\<cr></body>\<cr></html>", "html")
