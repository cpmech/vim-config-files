" ====================================================================================================
" basic configuration
" ===================
syntax on
set noswapfile
set nocompatible
set nowrap
set go-=m "remove menu bar
set go-=T "remove toolbar
set go-=r "remove right-hand scroll bar
set go-=L "remove left-hand scroll bar
"set gfn=Monospace\ 11 "also use Monospace 12 in Gnome Terminal
set number "line numbers
set relativenumber
set hls
"set mouse-=a "disable all mouse behaviour
if has("win32") || has("win64")
	set bs=2 "Enabling backspace key
	set mousemodel=extend " Sets click behaviour
endif
set tw=100
set laststatus=2
filetype plugin on



" ====================================================================================================
" colors
" ======
if (has("termguicolors"))
set termguicolors
endif
colorscheme molokai
"colorscheme mycolorsv2



" ====================================================================================================
" fonts and vim-devicons
" ======================
if has("win32") || has("win64")
	set guifont=Lucida_Console:h10:cDEFAULT
else
    "set encoding=utf8
    "set gfn=DroidSansMonoforPowerline\ Nerd\ Font\ 10
    "set gfn=RobotoMono\ Nerd\ Font\ 10
    "set gfn=BitstreamVeraSansMono\ Nerd\ Font\ 10
    set gfn=DejaVu\ Sans\ Mono\ 10
    "set gfn=Courier\ Prime\ 11
    "
    "get current font with
    ":set gfn?
endif



" ====================================================================================================
" run on save
" ===========
"au FileType javascript au BufWritePost,FileWritePost <buffer> execute 'JSHint' | cwindow



" ====================================================================================================
" tabs and spaces
" ===============
set listchars=tab:>.,trail:-
set tabstop=4
set shiftwidth=4
set expandtab



" ====================================================================================================
" auto close quickfix window
" ==========================

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END



" ====================================================================================================
" NeoBundle
" =========
if has('vim_starting')
  if has("win32") || has("win64")
    set runtimepath+=C:/Users/dorival/vimfiles/bundle/neobundle.vim/
  else
    set runtimepath+=/home/dorival/.vim/bundle/neobundle.vim/
  endif
endif

" Required:
if has("win32") || has("win64")
  call neobundle#begin(expand('C:/Users/dorival/vimfiles/bundle'))
else
  call neobundle#begin(expand('/home/dorival/.vim/bundle'))
endif

" Let NeoBundle manage NeoBundle. Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'vim-scripts/VisIncr'
"NeoBundle 'terryma/vim-expand-region'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'fatih/vim-go'
"NeoBundle 'garyburd/go-explorer'
"NeoBundle 'elzr/vim-json' "<<== DELETE
"NeoBundle 'helino/vim-json'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides' "<Leader>ig
NeoBundle 'Olical/vim-syntax-expand'
"NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'joequery/Stupid-EasyMotion'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'vim-scripts/closetag.vim'
"NeoBundle 'Townk/vim-autoclose' "bad0
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'honza/vim-snippets'

" Colors
NeoBundle 'mhartington/oceanic-next'

" Fancy
"NeoBundle 'vim-airline/vim-airline'
"NeoBundle 'vim-airline/vim-airline-themes'
"NeoBundle 'ryanoasis/vim-devicons'

" for javascript (JS)
NeoBundle 'marijnh/tern_for_vim' " needs to go to .vim/bundle/tern_for_vim and type npm install
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'peitalin/vim-jsx-typescript'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'flowtype/vim-flow'
NeoBundle 'prettier/vim-prettier'
"NeoBundle 'justinj/vim-react-snippets'
"NeoBundle 'mxw/vim-jsx' " for react (REACT) breaks ftplugin
"NeoBundle 'ianks/vim-tsx' "does NOT WORK

" for HTML
NeoBundle 'mattn/emmet-vim'

" for Julia
NeoBundle 'JuliaEditorSupport/julia-vim'

" camelcase
NeoBundle 'tpope/vim-abolish'

" for tex
"NeoBundle 'lervag/vimtex'

" Required:
call neobundle#end()

" Required: this needs to be here
filetype plugin indent on

" If there are uninstalled bundles found on startup, this will conveniently prompt you to install them.
NeoBundleCheck



" ====================================================================================================
" mappings with leader
" ====================
let mapleader = "\<Space>"

" open and save
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P

" enter visual line mode with <Space><Space>:
nmap <Leader><Leader> V

" region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)



" ====================================================================================================
" keyboard macros
" ===============
map  <S-CR>  O<ESC>
map  <CR>    o<ESC>
map  <F1>    <ESC>
imap <F1>    <ESC>
imap <C-F1>  <C-x><C-o>
map  <C-F2>  :set noai nocin nosi inde=<CR>
imap <C-F2>  :set noai nocin nosi inde=<CR>
map  <F2>         ]S
map  <S-F2>       [S
map  <F3>    :set tw=0<CR>:set wrap<CR>
map  <S-F3>  :set tw=100<CR>:set nowrap<CR>
"nmap <C-F3>  :set statusline=%{synIDattr(synID(line('.'),col('.'),1),'name')}<CR>
"map  <F4>    :let g:ycm_auto_trigger=0<CR>
"map  <C-F4>  :let g:ycm_auto_trigger=1<CR>
imap <F2>    <ESC>[S
imap <F3>    <ESC>]S
map  <F5>    :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>
map  <C-F5>  :set spell spelllang=pt_br<CR>
map  <S-F5>  :syn spell toplevel<CR>
"map  <S-F6>  :set undoreload=0<CR>:edit!<CR>
"map  <F6>         :w<Bar>:!make<CR>
"imap <F6>    <ESC>:w<Bar>:!make<CR>
map  <F6>         crsbw
imap <F6>    <ESC>crsbw
map  <S-F6>       crcbw
map  <F7>         :set invhls<CR>
imap <F7>    <ESC>:set invhls<CR>
map  <F8>         :split<CR>
imap <F8>    <ESC>:split<CR>
"map  <F9>         gqap
"imap <F9>    <ESC>gqap
map  <F9>         :call TeX_fmt()<CR>
imap <F9>    <ESC>:call TeX_fmt()<CR>i
map  <F10>        :bprev<CR>
imap <F10>   <ESC>:bprev<CR>
map  <F11>        :bnext<CR>
imap <F11>   <ESC>:bnext<CR>
nmap <F12>        :TagbarToggle<CR>
imap <F12>   <ESC>:TagbarToggle<CR>
map  <C-F12>      :set invlist<CR>
imap <C-F12> <ESC>:set invlist<CR>
map  <S-F12>      :set ts=4 sts=4<CR>:Space2Tab<CR>:set ts=2 sts=2<CR>:Tab2Space<CR>
map <C-o> :NERDTreeToggle<CR>
"vnoremap 00 :Strikethrough<CR>
map <C-S> :SyntasticToggleMode<CR>

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR> 



" ====================================================================================================
" EasyMotion
" ==========
map <Leader>j <Leader><Leader>w
map <Leader>k <Leader><Leader>W
map <Leader>f <Leader><Leader>f



" ====================================================================================================
" tern
" ====
let g:tern_map_keys = 1
"let g:tern_show_argument_hints='on_hold'



" ====================================================================================================
" concealing
" ==========
"set conceallevel=1 " even when your cursor is on top of them.
"set concealcursor=nvic



" ====================================================================================================
" prettier
" ========
let g:prettier#config#single_quote = 'true'
let g:prettier#config#tab_width = 2
let g:prettier#config#print_width = 100
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier


" ====================================================================================================
" javascript
" ==========
let g:jsx_ext_required = 0



" ====================================================================================================
" flow type
" =========
let g:flow#enable = 1



" ====================================================================================================
" syntastic
" =========
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" NEEDS:
"   sudo npm install -g eslint babel-eslint eslint-plugin-flowtype eslint-plugin-react
"let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_checkers = ['eslint']
let g:javascript_plugin_flow = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

let g:syntastic_error_symbol = 'E'
let g:syntastic_style_error_symbol = 'S'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_style_warning_symbol = 's'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn



" ====================================================================================================
" airline
" =======
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline_powerline_fonts = 1



" ====================================================================================================
" CtrlP
" =====
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif



" ====================================================================================================
" clear last search and fix highlight
" ===================================
nnoremap <Esc> :let @/ = ""<CR>
nmap <Leader>h :let @/ = '\<'.expand("<cword>").'\>'<CR>



" ====================================================================================================
" change highlight behaviour
" ==========================
"set cursorcolumn
" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction



" ====================================================================================================
" Jedi
" ====
let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
autocmd FileType python setlocal completeopt-=preview



" ====================================================================================================
" vimtex
" ======
let g:tex_conceal = ''



" ====================================================================================================
" YouCompleteMe
" =============
set completeopt-=preview
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1

" YCM-UltiSnips-SuperTab:
"let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<tab>'
"
" ====================================================================================================
" UltiSnips
" =========

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-Space>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-k>"

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['MyUltiSnips']
let g:UltiSnipsListSnippets="<c-l>"



" ====================================================================================================
" vim-go
" ======
"let g:go_snippet_engine = "neosnippet"
"

let g:go_fmt_autosave              = 1
let g:go_auto_type_info            = 0
let g:go_highlight_functions       = 1
let g:go_highlight_methods         = 1
let g:go_highlight_structs         = 1
let g:go_highlight_space_tab_error = 1
let g:go_fmt_command = "goimports"
"let g:go_info_mode = "gocode"
let g:go_def_mode = "godef"

" avoid showing two quickfix windows (Syntastic will be shown only)
let g:go_fmt_fail_silently = 1

" show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>s <Plug>(go-implements)

" show type info for the word under your cursor with <leader>i (useful if you have disabled 
" auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" replace gd (Goto Declaration) for the word under your cursor (replaces current buffer):
au FileType go nmap gd <Plug>(go-def)

" or open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" run GoLint on save
"au FileType go au BufWritePost,FileWritePost <buffer> execute 'GoLint' | cwindow



" ====================================================================================================
" brackets to parentheses and vice-versa
" ======================================
vmap <S-F2> :<C-V>s/\[\(.\)\]/(\1)/g<CR>
vmap <C-F2> :<C-V>s/(\(.\))/\[\1\]/g<CR>
vmap <S-F3> :<C-V>s/\[\(\d,\d\)\]/(\1)/g<CR>
vmap <C-F3> :<C-V>s/(\(\d,\d\))/[\1]/g<CR>
vmap <A-F3> :<C-V>s/\[\(.\)\]\[\(.\)\]/(\1,\2)/g<CR>



" ====================================================================================================
" overline, underline, double underline and strikeout
" ===================================================
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction



" ====================================================================================================
" disable middle button
" =====================
nnoremap <MiddleMouse>   <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse>   <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>



" ====================================================================================================
" wrap highlighted text in doublequotes
" =====================================
vmap [q "zdi"<C-R>z"



" ====================================================================================================
" colors
" ======
vmap [b "zdi<C-V><ESC>[1;34m<C-R>z<C-V><ESC>[0m<ESC>
vmap [r "zdi<C-V><ESC>[1;31m<C-R>z<C-V><ESC>[0m<ESC>
vmap [m "zdi<C-V><ESC>[1;35m<C-R>z<C-V><ESC>[0m<ESC>
vmap [c "zdi<C-V><ESC>[1;36m<C-R>z<C-V><ESC>[0m<ESC>
vmap [y "zdi<C-V><ESC>[1;33m<C-R>z<C-V><ESC>[0m<ESC>
vmap [g "zdi<C-V><ESC>[1;32m<C-R>z<C-V><ESC>[0m<ESC>
vmap [w "zdi<C-V><ESC>[1;37m<C-R>z<C-V><ESC>[0m<ESC>



" ====================================================================================================
" tabs and spaces
" ===============
" from:  http://vim.wikia.com/wiki/Super_retab
"
" Space2Tab   Convert spaces to tabs, only in indents.
" Tab2Space   Convert tabs to spaces, only in indents.
" RetabIndent Execute Space2Tab (if 'expandtab' is set), or Tab2Space (otherwise).

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)



" ====================================================================================================
" relative numbers
" ================
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>



" ====================================================================================================
" find colors (syntax/syntax hightlight)
" ======================================
" adds to statusline

" a little more informative version of the above
nmap <Leader>sI :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



" ====================================================================================================
" Reformat lines (getting the spacing correct in TeX)
" ===================================================
function! TeX_fmt()
    if (getline(".") != "")
    let save_cursor = getpos(".")
        let op_wrapscan = &wrapscan
        set nowrapscan
        let par_begin = '^\(%D\)\=\s*\($\|\\label\|\\begin\|\\end\|\\[\|\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
        let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\Begin\|\\End\|\\section\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
        norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
        let &wrapscan = op_wrapscan
    call setpos('.', save_cursor) 
    endif
endfun



" ====================================================================================================
" add/remove comments' markers
" ============================
if has("autocmd")

  " Comment this line at ^
  function! CommentLineToEnd(commentLeader)
     	let save_cpo   = &cpoptions
     	let save_paste = &paste
     	set cpo&vim
      set paste
      let escCommentLeader = escape(a:commentLeader, '^[.*\~]$')
      if getline(".") =~ '^\s*' . escCommentLeader
          execute "normal ^" . strlen(a:commentLeader) . "x"
      else
          execute "normal I" . a:commentLeader . "\<ESC>"
      endif
     	let &cpo   = save_cpo
     	let &paste = save_paste
  endfunction
  
  " Comment this line at ^ and $
  function! CommentLinePincer(commentLeader, commentTrailer)
     	let save_cpo   = &cpoptions
     	let save_paste = &paste
     	set cpo&vim
      set paste
      let escCommentLeader = escape(a:commentLeader, '^[.*\~]$')
      let escCommentTrailer = escape(a:commentTrailer, '^[.*\~]$')
      if getline(".") =~ '^\s*' . escCommentLeader . '.*' . escCommentTrailer . '$'
          execute "normal ^" . strlen(a:commentLeader) . "x$" . strlen(a:commentTrailer) . "hl" . strlen(a:commentTrailer) . "x"
      else
          execute "normal I" . a:commentLeader . "\<ESC>" . "A" . a:commentTrailer . "\<ESC>"
      endif
     	let &cpo   = save_cpo
     	let &paste = save_paste
  endfunction

  func Eatchar(pat)
    let c = nr2char(getchar())
    return (c =~ a:pat) ? '' : c
  endfunc

  augroup cssfile
    autocmd FileType css,scss call FMT_css()
    func FMT_css()
      noremap  <silent> <F1>      :call CommentLinePincer('/* ', ' */')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLinePincer('/* ', ' */')<CR>+
    endfunc
  augroup END

  augroup htmlfile
    autocmd FileType htm,html,shtml,rhtml call FMT_html()
    func FMT_html()
      iab itable <table border="1" cellpadding="5" cellspacing="1"><CR><CR><tr><CR><th></th><CR></tr><CR><CR><tr><CR><td></td><CR></tr><CR><CR></table><Up><Up><Up><Up><Up><Up><Up>
      iab ith <th></th><Left><Left><Left><Left><Left>
      iab itd <td></td><Left><Left><Left><Left><Left>
      iab itr <tr></tr><Left><Left><Left><Left><Left>
      noremap  <silent> <F1>      :call CommentLinePincer('<!-- ', ' -->')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLinePincer('<!-- ', ' -->')<CR>+
    endfunc
  augroup END

  augroup hashfiles
    autocmd FileType python,ruby,r,txt,cmake,input,material,sh,bash,julia call FMT_hash()
    func FMT_hash()
      noremap  <silent> <F1>      :call CommentLineToEnd('#')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLineToEnd('#')<CR>+
    endfunc
  augroup END

  augroup vimprog
    autocmd FileType vim call FMT_vim()
    func FMT_vim()
      noremap  <silent> <F1>      :call CommentLineToEnd('"')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLineToEnd('"')<CR>+
    endfunc
  augroup END

  augroup f95prog
    autocmd FileType fortran call FMT_f95()
    func FMT_f95()
      noremap  <silent> <F1>      :call CommentLineToEnd('!')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLineToEnd('!')<CR>+
    endfunc
  augroup END

  augroup cprog
    autocmd FileType c,cuda,cpp,go,javascript,glsl call FMT_cpp()
    func FMT_cpp()
      noremap  <silent> <F1>      :call CommentLineToEnd('//')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLineToEnd('//')<CR>+
    endfunc
  augroup END

  augroup latexfile
    autocmd FileType tex,sty,matlab call FMT_tex()
    func FMT_tex()
      noremap  <silent> <F1>      :call CommentLineToEnd('%')<CR>+
      inoremap <silent> <F1> <ESC>:call CommentLineToEnd('%')<CR>+
    endfunc
  augroup END

  augroup rubyhtml
    autocmd FileType eruby call FMT_rubyhtml()
    func FMT_rubyhtml()
      let g:rubycomplete_rails = 1
      call FMT_html()
      iab irb  <% %><Left><Left><Left>
      iab irbe <%= %><Left><Left><Left>
    endfunc
  augroup END

endif "endif has("autocmd")



" ====================================================================================================
" highlight on move
" =================
if has("autocmd")

let g:toggleHighlight = 0
function! ToggleHighlight(...)
  if a:0 == 1 "do toggle behaviour
    let g:toggleHighlight = 1 - g:toggleHighlight
    if g:toggleHighlight == 0
      call clearmatches()
    endif
    return
  endif
  if g:toggleHighlight == 0
    "call clearmatches()
  else
    silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
  endif
endfunction

autocmd CursorMoved * call ToggleHighlight()
map <C-F4> :call ToggleHighlight(1)<CR>

endif "endif has("autocmd")



" ====================================================================================================
" search with centered cursor
" ===========================
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
