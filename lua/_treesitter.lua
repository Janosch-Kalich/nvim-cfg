require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "lua", "cpp", "typescript" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

if vim.loop.os_uname().sysname == 'Linux' then
  require'nvim-treesitter.install'.compilers = { "gcc" }
else
  require'nvim-treesitter.install'.compilers = { "clang" }
end
