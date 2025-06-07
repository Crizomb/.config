-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "SnacksHeader", { fg = "#00FF00", bold = true }) -- bright green example
