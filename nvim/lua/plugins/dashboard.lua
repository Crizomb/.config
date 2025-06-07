---@class snacks.dashboard.Config
return {
  "snacks.nvim",
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,

        --         header = [[
        --
        --       ███████╗██╗  ██╗██████╗ ███████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗          Z
        --       ██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║   ██║██║████╗ ████║      Z
        --       ███████╗███████║██████╔╝█████╗  █████╔╝ ██║   ██║██║██╔████╔██║   z
        --       ╚════██║██╔══██║██╔══██╗██╔══╝  ██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║z
        --       ███████║██║  ██║██║  ██║███████╗██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        --       ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        -- ]],
        header = [[

]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {

        {
          -- section = "terminal",
          -- --cmd = "chafa ~/.config/nvim/dashboard-images/shreak_head_feets.png --size 60x17 --format symbols; sleep .1",
          -- cmd = "img=$(ls ~/.config/nvim/dashboard-images | shuf -n 2); chafa ~/.config/nvim/dashboard-images/$img --format symbols --size 60x17; sleep .1",
          -- random = 10,
        },
        { section = "header" },
        { section = "keys" },
        { section = "startup" },
      },
    },
  },
}
