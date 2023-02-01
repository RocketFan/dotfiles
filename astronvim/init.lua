local config = {
  plugins = {
    init = {
      [ "jackMort/ChatGPT.nvim" ] = {
        event = "BufRead",
        config = function()
          require("chatgpt").setup({
            -- optional configuration
          })
        end,
        requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim",
        },
      },
      [ 'glacambre/firenvim' ] = { 
        run = function() 
          vim.fn['firenvim#install'](0) 
        end,
      }
    }
  },
}

return config
