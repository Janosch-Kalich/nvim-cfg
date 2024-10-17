if exists('b.current_syntax')
  finish
endif

syn keyword instruction add addi sub subi mul muli div divi mod modi and andi or ori xor xori sll slli srl srli beq blt ble ja jai jr jri jal jali jrl jrli met meti sd sdi ld ldi mov movi push pop call ret

syn match register /t[0-5]\|zero\|m[0-3]\|r[0-1]\|a[0-3]\|sp\|ra\|\(x\(3[01]\|[0-2][0-9]\|[0-9]\)\)\(\s\|\n\|,\)\@=/

syn match label_use /@\(_\|\w\|\d|\)\+/
syn match label_def /@\(_\|\w\|\d|\)\+:/

syn match number /\([0-]\(\(x\x\+\)\|\(d\d\+\)\|\(o\o\+\)\|\(b[01]\+\)\)\(\s\|\n\|,\)\@=\)\|\d\+/

syn match comment /;.*$/

hi link instruction Statement
hi link label_use Ignore
hi link label_def Underlined
hi link number Number
hi link register Identifier
hi link comment Comment
