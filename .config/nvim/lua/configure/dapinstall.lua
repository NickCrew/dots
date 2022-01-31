return {
  "rcarriga/nvim-dap-ui",
  "Pocco81/DAPInstall.nvim",
  requires = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    local dap_install = require('dap-install')
    dap_install.setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })
    dap_install.config(
      "jsnode", {
        configurations = {
          {
            program = "app.js"
          }
        }
      }
    )
  end
}
