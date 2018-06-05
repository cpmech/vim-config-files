if exists("b:did_my_html_ftplugin")
	finish
endif
let b:did_my_html_ftplugin = 1

set tabstop=2
set shiftwidth=2
set expandtab

call IMAP ("THELLO", "<!DOCTYPE html>\<cr><html lang=\"en\">\<cr>\<cr><head>\<cr><title>My App</title>\<cr><meta charset=\"utf-8\">\<cr><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\<cr></head>\<cr>\<cr><body>\<cr><noscript>\<cr>You need to enable JavaScript to run this app.\<cr></noscript>\<cr></body>\<cr>\<cr></html>", "html")
