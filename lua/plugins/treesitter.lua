return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python" },
            auto_install = true,
            highlight = { enable = true },
        })
    end
}
