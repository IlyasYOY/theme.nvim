local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")
local home = vim.env.THEME_TEST_HOME or (root .. "/.test-home")

vim.env.XDG_CONFIG_HOME = vim.env.XDG_CONFIG_HOME or (home .. "/config")
vim.env.XDG_DATA_HOME = vim.env.XDG_DATA_HOME or (home .. "/data")
vim.env.XDG_CACHE_HOME = vim.env.XDG_CACHE_HOME or (home .. "/cache")
vim.env.XDG_STATE_HOME = vim.env.XDG_STATE_HOME or (home .. "/state")

for _, dir in ipairs {
    vim.env.XDG_CONFIG_HOME,
    vim.env.XDG_DATA_HOME,
    vim.env.XDG_CACHE_HOME,
    vim.env.XDG_STATE_HOME,
} do
    vim.fn.mkdir(dir, "p")
end

vim.opt.runtimepath:prepend(root)
vim.opt.swapfile = false
package.path = root .. "/?.lua;" .. root .. "/?/init.lua;" .. package.path
