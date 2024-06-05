local lib = require("lib")

return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

    local configs = {
      cssls = {},
      jsonls = {},
      yamlls = {},
      tsserver = {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", {
                command = "_typescript.organizeImports",
                arguments = { vim.api.nvim_buf_get_name(bufnr) },
              }, 500)
            end
          })
        end
      },
      eslint = {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end
      },
      lua_ls = {
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      },
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = lib.keys(configs)
    })

    local lsp = require("lspconfig")
    lib.each(lib.keys(configs), function(config)
      lsp[config].setup(configs[config])
    end)
  end
}
