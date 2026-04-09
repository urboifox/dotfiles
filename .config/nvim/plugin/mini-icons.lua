vim.pack.add({ "https://github.com/echasnovski/mini.icons" })

package.preload["nvim-web-devicons"] = function()
    require("mini.icons").mock_nvim_web_devicons()
    return package.loaded["nvim-web-devicons"]
end

require("mini.icons").setup()
