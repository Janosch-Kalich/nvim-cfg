if exists('b.current_syntax')
  finish
endif

syn keyword instruction const add sub mul div eq gt lt geq leq jmp br ret call copy cast str ref deref

syn match directive /#\(\(pub\)\|\(ext\)\)/

syn match comment /;.*$/

syn match string /".*"/

syn keyword type void byte word dword qword single double

syn match ops /[{()}:]/

syn match number /\d\+/
syn match float /\(\d*\.\d\+\)\|\(\d\+\.\d*\)/

syn match ident /\(_\|[a-zA-Z]\)\(_\|[a-zA-Z0-9]\|\)*/

syn match function /@\(_\|[a-zA-Z]\)\(_\|[a-zA-Z0-9]\)*/

syn match label /\.\(_\|[a-zA-Z]\)\(_\|[a-zA-Z0-9]\)*/

hi link instruction Statement
hi link directive PreProc
hi link comment Comment
hi link function_def Function
hi link string String
hi link label Special
hi link type Type
hi link ops Operator
hi link number Number
hi link float Number
hi link ident Ignore
