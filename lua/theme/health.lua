local M = {}

local MIN_VERSION = { major = 0, minor = 11, patch = 0 }

local function version_at_least(current, minimum)
    for _, key in ipairs { "major", "minor", "patch" } do
        local left = current[key] or 0
        local right = minimum[key] or 0
        if left ~= right then
            return left > right
        end
    end
    return true
end

local function highlight_exists(name)
    local ok, value =
        pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
    return ok and next(value) ~= nil
end

function M.check()
    local health = vim.health
    health.start "theme.nvim"

    local version = vim.version()
    local rendered = ("%d.%d.%d"):format(
        version.major,
        version.minor,
        version.patch
    )
    if version_at_least(version, MIN_VERSION) then
        health.ok("Neovim " .. rendered .. " is supported")
    else
        health.error("Neovim " .. rendered .. " is too old; 0.11+ is required")
    end

    local files =
        vim.api.nvim_get_runtime_file("colors/ilyasyoy-mono.lua", false)
    if #files > 0 then
        health.ok "colors/ilyasyoy-mono.lua is available"
    else
        health.error "colors/ilyasyoy-mono.lua is missing from runtimepath"
    end

    health.info("background=" .. vim.o.background)
    if vim.g.colors_name == "ilyasyoy-mono" then
        health.ok "ilyasyoy-mono is active"
        if vim.o.termguicolors then
            health.ok "termguicolors is enabled"
        else
            health.warn "termguicolors is disabled"
        end
        for _, group in ipairs { "Normal", "DiagnosticError", "FzfLuaNormal" } do
            if highlight_exists(group) then
                health.ok(group .. " is defined")
            else
                health.error(group .. " is not defined")
            end
        end
    else
        health.info "ilyasyoy-mono is installed but not active"
    end
end

return M
