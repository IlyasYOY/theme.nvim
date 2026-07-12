local function highlight(name, link)
    return vim.api.nvim_get_hl(0, { name = name, link = link or false })
end

describe("ilyasyoy-mono colorscheme", function()
    local original_background

    before_each(function()
        original_background = vim.o.background
        vim.cmd "highlight clear"
        vim.g.colors_name = nil
    end)

    after_each(function()
        vim.o.background = original_background
        vim.g.colors_name = nil
    end)

    it("loads the dark palette through the colorscheme command", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme "ilyasyoy-mono"

        local normal = highlight "Normal"
        assert.equals("ilyasyoy-mono", vim.g.colors_name)
        assert.equals(0x000000, normal.bg)
        assert.equals(0xDADADA, normal.fg)
        assert.is_true(vim.o.termguicolors)
    end)

    it("loads the light palette through the same colorscheme", function()
        vim.o.background = "light"
        vim.cmd.colorscheme "ilyasyoy-mono"

        local normal = highlight "Normal"
        assert.equals("ilyasyoy-mono", vim.g.colors_name)
        assert.equals(0xEEEEEE, normal.bg)
        assert.equals(0x000000, normal.fg)
    end)

    it("defines core and plugin integration groups", function()
        vim.o.background = "dark"
        vim.cmd.colorscheme "ilyasyoy-mono"

        assert.is_not_nil(highlight("DiagnosticError").fg)
        assert.is_not_nil(highlight("FzfLuaNormal").fg)
        assert.equals("Function", highlight("@function", true).link)
    end)
end)
