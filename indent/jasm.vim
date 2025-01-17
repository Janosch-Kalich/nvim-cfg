if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=s:getJasmIndent()
setlocal indentkeys=<:>,!^F,o,O

let b:undo_indent = "setlocal indentexpr< indentkeys<"

function! s:getJasmIndent()
  let line = getline(v:lnum)
  let ind = shiftwidth()

  " If the line is a label (starts with ':' terminated keyword), 
  " then don't indent
  if line =~ '\(^\s*@\k\+:\)\|\(^\s*\d\)'
    let ind = 0
  endif

  echo 'Hi :3'

  return ind
endfunction
