return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    config = function()
        require('flash').setup {
            search = {
                mode = 'search',
            },
        }

        vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#e0def4', bg = '#eb6f92', bold = true }) -- love
        vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#191724', bg = '#c4a7e7', bold = true }) -- gold
        vim.api.nvim_set_hl(0, 'FlashCurrent', { fg = '#191724', bg = '#9ccfd8', bold = true }) -- foam
    end,
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
