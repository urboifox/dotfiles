return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
        require('flash').setup {
            search = {
                mode = 'search',
            },
            modes = {
                char = {
                    enabled = false,
                },
            },
        }

        vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#e0def4', bg = '#eb6f92', bold = true }) -- love
        vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#191724', bg = '#c4a7e7', bold = true }) -- gold
        vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#191724', bg = '#9ccfd8', bold = true }) -- foam
    end,
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
