require("settings")
require("plugins")
require("maps") -- key mappings

-- colorscheme config: kanagawa
local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
    vim.cmd("colorscheme kanagawa")
else
    return
end

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()


local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<<Leader>s", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})