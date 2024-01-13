require("formatter").setup {
  filetype = {
    haskell = {
      require("formatter.filetypes.haskell").stylish_haskell
    },
    dart = {
      require("formatter.filetypes.dart").dartformat
    },
    vue = {
      require("formatter.filetypes.vue").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    latex = {
      require("formatter.filetypes.latex").latexindent
    },
    tex = {
      require("formatter.filetypes.tex").latexindent
    }

  }
}
