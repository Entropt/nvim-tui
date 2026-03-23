require("core.set")
require("core.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    ui = {
        -- Make lazy.nvim's UI minimal text-based
        icons = {
            cmd = "",
            config = "",
            event = "",
            ft = "",
            init = "",
            keys = "",
            plugin = "",
            runtime = "",
            require = "",
            source = "",
            start = "",
            task = "",
            lazy = "",
        },
    }
})
