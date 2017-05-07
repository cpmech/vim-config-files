" Vim syntax file
" Language:	Input
" Maintainer:	Dorival Pedroso <dorival.pedroso@gmail.com>
" Last Change:	2011-01-20
" Credits:	Dorival Pedroso <dorival.pedroso@gmail.com>

" For version 5.x: Clear all syntax items.
" For version 6.x: Quit when a syntax file was already loaded.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" general keys
syn keyword inputStatement matid       
syn keyword inputStatement flwid       
syn keyword inputStatement ninc        
syn keyword inputStatement cdrift      
syn keyword inputStatement stol        
syn keyword inputStatement ssout       
syn keyword inputStatement ctetg       
syn keyword inputStatement fem         
syn keyword inputStatement dyn         
syn keyword inputStatement hm          
syn keyword inputStatement tf          
syn keyword inputStatement dt          
syn keyword inputStatement dtout       
syn keyword inputStatement tsw         
syn keyword inputStatement ndiv        
syn keyword inputStatement nip         
syn keyword inputStatement o2          
syn keyword inputStatement ray         
syn keyword inputStatement am          
syn keyword inputStatement ak          
syn keyword inputStatement rk          
syn keyword inputStatement rkscheme    
syn keyword inputStatement rkstol      
syn keyword inputStatement refdat      
syn keyword inputStatement refsim      
syn keyword inputStatement refana      
syn keyword inputStatement idxvert1    
syn keyword inputStatement idxvert2    
syn keyword inputStatement idxvert3    
syn keyword inputStatement optdbl1     
syn keyword inputStatement optdbl2     
syn keyword inputStatement optdbl3     
syn keyword inputStatement nldt_nsml   
syn keyword inputStatement nldt_nn     
syn keyword inputStatement nldt_n      
syn keyword inputStatement nldt_ll     
syn keyword inputStatement nldt_sch    
syn keyword inputStatement nldt_m      
syn keyword inputStatement maxit       
syn keyword inputStatement tolr        
syn keyword inputStatement fnkey       
syn keyword inputStatement pcam0       
syn keyword inputStatement scheme      
syn keyword inputStatement vtufile     
syn keyword inputStatement suscheme    
syn keyword inputStatement sustol      
syn keyword inputStatement surkscheme  
syn keyword inputStatement dcmaxit     
syn keyword inputStatement dcftol      
syn keyword inputStatement pw0
syn keyword inputStatement rkdyncte
syn keyword inputStatement vwp

" specific keys
syn keyword inputStatement matids xmatids outnods

" path subkeys
syn keyword inputSubkeys    npath nelemprps nstages nbcs
syn keyword inputSubsubkeys ndat

" sub-subkeys
syn keyword inputBuiltin kcam
syn keyword inputBuiltin dpcam
syn keyword inputBuiltin lode
syn keyword inputBuiltin dex
syn keyword inputBuiltin dey
syn keyword inputBuiltin dez
syn keyword inputBuiltin dexy
syn keyword inputBuiltin deyz
syn keyword inputBuiltin dezx
syn keyword inputBuiltin dsx
syn keyword inputBuiltin dsy
syn keyword inputBuiltin dsz
syn keyword inputBuiltin dsxy
syn keyword inputBuiltin dsyz
syn keyword inputBuiltin dszx
syn keyword inputBuiltin dpw
syn keyword inputBuiltin dSw

syn keyword inputBuiltin elemtag
syn keyword inputBuiltin prob
syn keyword inputBuiltin geom
syn keyword inputBuiltin psa
syn keyword inputBuiltin pse
syn keyword inputBuiltin fra
syn keyword inputBuiltin d2d
syn keyword inputBuiltin d3d
syn keyword inputBuiltin rho
syn keyword inputBuiltin geosta K0 surf water pospw

syn keyword inputBuiltin tag
syn keyword inputBuiltin ux
syn keyword inputBuiltin uy
syn keyword inputBuiltin uz
syn keyword inputBuiltin fx
syn keyword inputBuiltin fy
syn keyword inputBuiltin fz
syn keyword inputBuiltin qn
syn keyword inputBuiltin pw
syn keyword inputBuiltin bcf fgrav

" text keywords
syn keyword inputNumber ME
syn keyword inputNumber Equilib HydroMech
syn keyword inputNumber Quad4 Quad8 Hex8 Hex20 Tet10 Tri3 Tri6

" comments
syn match   inputComment "#.*$" contains=inputTodo,@Spell
syn keyword inputTodo	 FIXME NOTE NOTES TODO XXX contained

" It is very important to understand all details before changing the
" regular expressions below or their order.
" The word boundaries are *not* the floating-point number boundaries
" because of a possible leading or trailing decimal point.
" The expressions below ensure that all valid number literals are
" highlighted, and invalid number literals are not.  For example,
"
" - a decimal point in '4.' at the end of a line is highlighted,
" - a second dot in 1.0.0 is not highlighted,
" - 08 is not highlighted,
" - 08e0 or 08j are highlighted,
"
if !exists("input_no_number_highlight")
  " numbers (including longs and complex)
  syn match   inputNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   inputNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   inputNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   inputNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   inputNumber	"\<\d\+[jJ]\>"
  syn match   inputNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   inputNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   inputNumber
	\ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

syn region  inputString
      \ start=+[uU]\=\z(["]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=inputEscape,@Spell

syn match   inputEscape	+\\[abfnrtv'"\\]+ contained
syn match   inputEscape	"\\\o\{1,3}" contained
syn match   inputEscape	"\\x\x\{2}" contained
syn match   inputEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   inputEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   inputEscape	"\\$"

if version >= 508 || !exists("did_input_syn_inits")
  if version <= 508
    let did_input_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink inputStatement	Statement
  HiLink inputConditional	Conditional
  HiLink inputRepeat		Repeat
  HiLink inputOperator		Operator
  HiLink inputException	Exception
  HiLink inputSubkeys		Include
  HiLink inputSubsubkeys	ExtraFun
  HiLink inputDecorator	Define
  HiLink inputFunction		Function
  HiLink inputComment		Comment
  HiLink inputTodo		Todo
  HiLink inputString		String
  HiLink inputRawString	String
  HiLink inputEscape		Special
  if !exists("input_no_number_highlight")
    HiLink inputNumber		Number
  endif
  if !exists("input_no_builtin_highlight")
    HiLink inputBuiltin	Function
  endif
  delcommand HiLink
endif

let b:current_syntax = "input"
