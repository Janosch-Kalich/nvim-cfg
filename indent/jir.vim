if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=s:getJirIndent()
setlocal indentkeys=<:>,!^F,o,O

let b:undo_indent = "setlocal indentexpr< indentkeys<"

function! s:getJirIndent()
  let line = getline(v:lnum)
  let ind = shiftwidth()

  if line =~ '^\s*\(\(@[a-zA-Z0-9]\+.*{\)\|}\|\(\.[a-zA-Z0-9]\+\)\|\(#.*\)\)$'
    let ind = 0
  endif

  return ind
endfunction
