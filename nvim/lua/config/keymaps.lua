-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function CreateBottomTerminal()
  -- Prepare the command to runw
  local command = "cd " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. "\n"
  -- Open a new terminal window at the bottom and send the command
  vim.cmd("botright split | resize 10 | terminal")

  -- Get the new terminal buffer and job ID
  local term_buf = vim.api.nvim_get_current_buf()
  local new_term_job_id = vim.api.nvim_buf_get_var(term_buf, "terminal_job_id")

  -- Wait a moment for the terminal to initialize and send the command
  vim.defer_fn(function()
    if new_term_job_id then
      vim.fn.chansend(new_term_job_id, command)
    else
      print("Error: Failed to retrieve terminal job ID!")
    end
  end, 100)
end

-- Map to <leader>r
vim.api.nvim_set_keymap("n", "<leader>r", ":lua CreateBottomTerminal()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", function()
  Snacks.dashboard()
end, { desc = "Open mini starter" })
