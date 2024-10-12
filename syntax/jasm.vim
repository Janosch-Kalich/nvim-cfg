if exists('b.current_syntax')
  finish
endif

syn keyword instruction add addi sub subi mul muli div divi mod modi and andi or ori xor xori sll slli srl srli beq ja jai jr jri jal jali jrl jrli hlt sd sdi ld ldi mov movi push pop call ret

syn match register /x\(3[01]\|[0-2][0-9]\|[0-9]\)\(\s\|\n\|,\)\@=/

syn match number /\([0-]\(\(x\x\+\)\|\(d\d\+\)\|\(o\o\+\)\|\(b[01]\+\)\)\(\s\|\n\|,\)\@=\)\|\d\+/

syn match label /@\(_\|\w\|\d\)\+:/

syn match comment /;.*$/

hi link instruction Statement
hi link number Number
hi link label Underlined
hi link register Identifier
hi link comment Comment
