vim.g.knap_settings = {
  texoutputtext = "pdf",
  textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
  textopdfviewerlaunch = "mupdf %outputfile%",
  textopdfviewerrefresh = "kill -HUP %pid%"
}
