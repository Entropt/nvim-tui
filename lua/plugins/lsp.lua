return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason-lspconfig").setup({
            ensure_installed = { 
                "clangd",        -- C/C++
                "pyright",       -- Python
                "ts_ls",         -- TypeScript/JavaScript
                "rust_analyzer", -- Rust
                "gopls",         -- Go
                "lua_ls",        -- Lua (needed for editing Neovim config)
            },
            handlers = {
                -- 1. This is the "Generic Setup" handler.
                -- Whenever you install ANY language server, it automatically routes through here
                -- and hooks up your Autocompletion and keybinds.
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,

                -- 2. Specific exception for Lua so it doesn't complain about the "vim" global variable
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end,
            },
        })
        
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
            callback = function(e)
                local opts = { buffer = e.buf }

                -- Standard built-in text-based float, no heavy UI
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end
        })
    end
}
