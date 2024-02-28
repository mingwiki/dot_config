require("bufferchad").setup({
  mapping = "<leader>l",        -- Map any key, or set to NONE to disable key mapping
  mark_mapping = "<leader>m",   -- The keybinding to display just the marked buffers
  order = "LAST_USED_UP",       -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
  style = "default",            -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
  close_mapping = "<Esc>", -- only for the default style window.
})
