-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter


local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'css', 'html', 'javascript', 'json', 'lua', 'python',
   'vim', 'yaml', 'query'
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
