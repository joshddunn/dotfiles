return {
  "puremourning/vimspector",
  init = function()
    vim.keymap.set("n", ",dd", ":call vimspector#Launch()<cr>")
    vim.keymap.set("n", ",de", ":call vimspector#Reset()<cr>")
    vim.keymap.set("n", ",dr", ":call vimspector#Restart()<cr>")
    vim.keymap.set("n", ",dc", ":call vimspector#Continue()<cr>")

    vim.keymap.set("n", ",dt", ":call vimspector#ToggleBreakpoint()<cr>")
    vim.keymap.set("n", ",dT", ":call vimspector#ClearBreakpoints()<cr>")

    vim.keymap.set("n", ",dk", "<Plug>VimspectorRestart")
    vim.keymap.set("n", ",dh", "<Plug>VimspectorStepOut")
    vim.keymap.set("n", ",dl", "<Plug>VimspectorStepInto")
    vim.keymap.set("n", ",dj", "<Plug>VimspectorStepOver")

    vim.g.vimspector_base_dir = os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/start/vimspector"
    vim.g.vimspector_install_gadgets = { "vscode-node-debug2" }
    vim.g.vimspector_configurations = {
      Node = {
        adapter = "vscode-node",
        default = true,
        breakpoints = {
          exception = {
            all = "N",
            uncaught = "N"
          }
        },
        configuration = {
          name = "Attaching to node",
          type = "node",
          request = "attach",
          restart = true, -- this should work but doesn't seem to
          port = 9229,
        }
      }
    }

    vim.g.vimspector_sidebar_width = 100
    vim.g.vimspector_bottombar_height = 5
  end
}
