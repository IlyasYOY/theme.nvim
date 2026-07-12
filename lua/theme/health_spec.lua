local function capture_health(fn)
    local original = vim.health
    local records = {}
    vim.health = {}
    for _, level in ipairs { "start", "ok", "warn", "error", "info" } do
        vim.health[level] = function(message)
            records[#records + 1] = { level = level, message = message }
        end
    end
    local ok, err = pcall(fn)
    vim.health = original
    if not ok then
        error(err, 2)
    end
    return records
end

local function has(records, level, text)
    for _, record in ipairs(records) do
        if record.level == level and record.message:find(text, 1, true) then
            return true
        end
    end
    return false
end

describe("theme.health", function()
    it("reports the installed but inactive colorscheme", function()
        vim.g.colors_name = nil
        local records = capture_health(function()
            require("theme.health").check()
        end)

        assert.truthy(has(records, "start", "theme.nvim"))
        assert.truthy(
            has(records, "ok", "colors/ilyasyoy-mono.lua is available")
        )
        assert.truthy(has(records, "info", "installed but not active"))
    end)

    it("reports active palette highlights", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme "ilyasyoy-mono"
        local records = capture_health(function()
            require("theme.health").check()
        end)

        assert.truthy(has(records, "ok", "ilyasyoy-mono is active"))
        assert.truthy(has(records, "ok", "Normal is defined"))
        assert.truthy(has(records, "ok", "DiagnosticError is defined"))
        assert.truthy(has(records, "ok", "FzfLuaNormal is defined"))
    end)
end)
