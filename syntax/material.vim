" Vim syntax file
" Language:	Material
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
syn keyword materialStatement ID name

" models
syn keyword materialStatement ElastoPlastic CamClay

" path subkeys
syn keyword materialSubkeys nprms ninis nctes

" parameters
syn keyword materialBuiltin E nu VM DP MC MN c sY phi psi
syn keyword materialBuiltin newsu betsu alpsu
syn keyword materialBuiltin lam kap
syn keyword materialBuiltin grav gamW rho rhoS por gamNat gamSat
syn keyword materialBuiltin kwsat akw
syn keyword materialBuiltin bc_lam bc_sb  bc_wr
syn keyword materialBuiltin zi_del zi_bet zi_gam zi_a zi_b zi_alp
syn keyword materialBuiltin hz_a   hz_b   hz_A   hz_B
syn keyword materialBuiltin ld xRd yR xRw bd bw b1
syn keyword materialBuiltin BC     ZI     HZ     PW

" initial values
syn keyword materialBuiltin v0 OCR
syn keyword materialBuiltin pw Sw

" models
syn keyword materialNumber LinElastic CamClay ElastoPlastic UnsatFlow

" comments
syn match   materialComment "#.*$" contains=materialTodo,@Spell
syn keyword materialTodo	 FIXME NOTE NOTES TODO XXX contained

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
if !exists("material_no_number_highlight")
  " numbers (including longs and complex)
  syn match   materialNumber	"\<0[oO]\=\o\+[Ll]\=\>"
  syn match   materialNumber	"\<0[xX]\x\+[Ll]\=\>"
  syn match   materialNumber	"\<0[bB][01]\+[Ll]\=\>"
  syn match   materialNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
  syn match   materialNumber	"\<\d\+[jJ]\>"
  syn match   materialNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
  syn match   materialNumber
	\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
  syn match   materialNumber
	\ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

syn region  materialString
      \ start=+[uU]\=\z(["]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=materialEscape,@Spell

syn match   materialEscape	+\\[abfnrtv'"\\]+ contained
syn match   materialEscape	"\\\o\{1,3}" contained
syn match   materialEscape	"\\x\x\{2}" contained
syn match   materialEscape	"\%(\\u\x\{4}\|\\U\x\{8}\)" contained
" Python allows case-insensitive Unicode IDs: http://www.unicode.org/charts/
syn match   materialEscape	"\\N{\a\+\%(\s\a\+\)*}" contained
syn match   materialEscape	"\\$"

if version >= 508 || !exists("did_material_syn_inits")
  if version <= 508
    let did_material_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default highlight links.  Can be overridden later.
  HiLink materialStatement	Statement
  HiLink materialConditional	Conditional
  HiLink materialRepeat		Repeat
  HiLink materialOperator		Operator
  HiLink materialException	Exception
  HiLink materialSubkeys		Include
  HiLink materialSubsubkeys	ExtraFun
  HiLink materialDecorator	Define
  HiLink materialFunction		Function
  HiLink materialComment		Comment
  HiLink materialTodo		Todo
  HiLink materialString		String
  HiLink materialRawString	String
  HiLink materialEscape		Special
  if !exists("material_no_number_highlight")
    HiLink materialNumber		Number
  endif
  if !exists("material_no_builtin_highlight")
    HiLink materialBuiltin	Function
  endif
  delcommand HiLink
endif

let b:current_syntax = "material"
