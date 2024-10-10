if exists('b.current_syntax')
  finish
endif

syn keyword instruction add addi sub subi or ori beq

syn match register /x\(3[01]\|[0-2][0-9]\|[0-9]\)\(\s\|\n\|,\)\@=/

syn match number /\(0\(\(x\x\+\)\|\(d\d\+\)\|\(o\o\+\)\|\(b[01]\+\)\)\(\s\|\n\|,\)\@=\)\|\d\+/

syn match label /@\(_\|\w\|\d\)\+:/

hi link instruction Statement
hi link number Number
hi link label Underlined
hi link register Identifier
