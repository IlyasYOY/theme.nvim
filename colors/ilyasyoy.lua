-- setup colors
local palette = {
    { keys = { "negative_light" }, dark = "#722529", light = "#a0393d" },
    { keys = { "negative" }, dark = "#d75f5f", light = "#c04040" },

    { keys = { "positive_strong" }, dark = "#5f875f", light = "#3a6b3a" },
    { keys = { "positive" }, dark = "#416241", light = "#2d472d" },
    { keys = { "positive_light" }, dark = "#87af87", light = "#5a8f5a" },

    { keys = { "warning" }, dark = "#d7875f", light = "#c47030" },
    { keys = { "warning_deep" }, dark = "#af875f", light = "#9a6530" },
    { keys = { "warning_deeper" }, dark = "#875f5f", light = "#754040" },

    { keys = { "interesting" }, dark = "#5f87af", light = "#306b9d" },
    { keys = { "interesting_dark" }, dark = "#3b4050", light = "#505565" },

    { keys = { "highlight" }, dark = "#d787af", light = "#c56095" },
    { keys = { "special" }, dark = "#8787af", light = "#606095" },

    -- Grayscale
    { keys = { "accent" }, dark = "#bcbcbc", light = "#111111" },
    { keys = { "accent_light" }, dark = "#949494", light = "#222222" },
    { keys = { "ignore_light" }, dark = "#767676", light = "#888888" },
    { keys = { "ignore" }, dark = "#585858", light = "#999999" },
    { keys = { "ignore_hard" }, dark = "#444444", light = "#aaaaaa" },
    { keys = { "over_bg" }, dark = "#262626", light = "#ffffff" },
    { keys = { "changed_muted" }, dark = "#333333", light = "#cccccc" },
    { keys = { "bg" }, dark = "#000000", light = "#f0f0f0" },
}

local function load()
    local bg = vim.o.background

    -- Set up colorscheme
    vim.cmd "set termguicolors"
    vim.cmd 'let g:colors_name = "ilyasyoy"'
    vim.cmd("set background=" .. bg)

    -- Define colors based on background
    local colors = {}
    for _, value in ipairs(palette) do
        for _, key in ipairs(value.keys) do
            if bg == "light" then
                colors[key] = value.light
            elseif bg == "dark" then
                colors[key] = value.dark
            end
        end
    end

    -- Add special colors
    colors.none = "none"

    -- EDITOR BASICS
    -- https://neovim.io/doc/user/syntax.html#group-name

    -- Custom groups
    vim.api.nvim_set_hl(
        0,
        "Noise",
        { fg = colors.ignore_light, bg = colors.none }
    )

    -- Basic groups
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.ignore, bg = colors.none })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.accent, bg = colors.bg })

    vim.api.nvim_set_hl(
        0,
        "NonText",
        { fg = colors.ignore_hard, bg = colors.none }
    )
    vim.api.nvim_set_hl(0, "Error", { fg = colors.negative, bg = colors.none })
    vim.api.nvim_set_hl(
        0,
        "Number",
        { fg = colors.positive_light, bg = colors.none }
    )
    vim.api.nvim_set_hl(0, "Special", { fg = colors.special, bg = colors.none })
    vim.api.nvim_set_hl(
        0,
        "String",
        { fg = colors.positive_strong, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "Title",
        { fg = colors.interesting, bg = colors.none }
    )
    vim.api.nvim_set_hl(0, "Todo", { fg = colors.positive, bg = colors.none })

    vim.api.nvim_set_hl(0, "Warning", { fg = colors.warning, bg = colors.none })

    -- https://neovim.io/doc/user/syntax.html#hl-User1
    vim.api.nvim_set_hl(
        0,
        "User1",
        { fg = colors.warning_deep, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "User2",
        { fg = colors.interesting, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "User3",
        { fg = colors.warning_deeper, bg = colors.none }
    )

    -- search and highlight stuff
    vim.api.nvim_set_hl(
        0,
        "MatchParen",
        { fg = colors.accent, bg = colors.none, underline = true }
    )

    vim.api.nvim_set_hl(
        0,
        "CurSearch",
        { fg = colors.highlight, bg = colors.none, underline = true }
    )
    vim.api.nvim_set_hl(
        0,
        "IncSearch",
        { fg = colors.highlight, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "Search",
        { fg = colors.highlight, bg = colors.none }
    )

    vim.api.nvim_set_hl(
        0,
        "Pmenu",
        { fg = colors.ignore_light, bg = colors.over_bg }
    )
    vim.api.nvim_set_hl(
        0,
        "PmenuSel",
        { fg = colors.accent_light, bg = colors.bg, underline = true }
    )

    vim.api.nvim_set_hl(
        0,
        "PmenuThumb",
        { fg = colors.warning_deep, bg = colors.over_bg }
    ) -- not sure what this is
    vim.api.nvim_set_hl(
        0,
        "WildMenu",
        { fg = colors.highlight, bg = colors.over_bg }
    )

    vim.api.nvim_set_hl(
        0,
        "StatusLine",
        { fg = colors.none, bg = colors.over_bg }
    )
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.bg, bg = colors.none })

    vim.api.nvim_set_hl(
        0,
        "Visual",
        { fg = colors.interesting, bg = colors.over_bg }
    )
    vim.api.nvim_set_hl(
        0,
        "VisualNOS",
        { fg = colors.interesting, bg = colors.over_bg }
    )

    vim.api.nvim_set_hl(0, "qffilename", { link = "Title" })

    -- snippets
    -- I don't want to highlight when I use built-in completion.
    vim.api.nvim_set_hl(0, "SnippetTabStop", {  })

    -- spelling problems are shown!
    vim.api.nvim_set_hl(
        0,
        "SpellBad",
        { fg = colors.negative, bg = colors.none, undercurl = true }
    )
    vim.api.nvim_set_hl(
        0,
        "SpellCap",
        { fg = colors.warning, bg = colors.none, undercurl = true }
    )
    vim.api.nvim_set_hl(
        0,
        "SpellLocal",
        { fg = colors.warning_deep, bg = colors.none, undercurl = true }
    )
    vim.api.nvim_set_hl(
        0,
        "SpellRare",
        { fg = colors.interesting, bg = colors.none, undercurl = true }
    )

    -- LINKS
    vim.api.nvim_set_hl(0, "Constant", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Boolean", { link = "Number" })
    vim.api.nvim_set_hl(0, "Character", { link = "Number" })
    vim.api.nvim_set_hl(0, "Conditional", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Debug", { link = "Todo" })
    vim.api.nvim_set_hl(0, "Delimiter", { link = "Noise" })
    vim.api.nvim_set_hl(0, "Directory", { link = "String" })
    vim.api.nvim_set_hl(0, "Exception", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Function", { link = "Special" })
    vim.api.nvim_set_hl(0, "Identifier", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Include", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Keyword", { link = "Noise" })
    vim.api.nvim_set_hl(
        0,
        "Label",
        { fg = colors.accent, bg = colors.none, bold = true }
    )
    vim.api.nvim_set_hl(0, "Macro", { link = "User2" })
    vim.api.nvim_set_hl(0, "Operator", { link = "Noise" })
    vim.api.nvim_set_hl(0, "PreProc", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Repeat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "SpecialChar", { link = "Special" })
    vim.api.nvim_set_hl(0, "SpecialKey", { link = "Special" })
    vim.api.nvim_set_hl(0, "Statement", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StorageClass", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Structure", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Tag", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Type", { link = "User3" })
    vim.api.nvim_set_hl(0, "TypeDef", { link = "User3" })

    -- treesitter stuff
    vim.api.nvim_set_hl(0, "@type.builtin", { link = "User3" })
    vim.api.nvim_set_hl(0, "@constant.builtin", { link = "User1" })
    vim.api.nvim_set_hl(0, "@constructor", { link = "Special" })
    vim.api.nvim_set_hl(0, "@exception.operator", { link = "Special" })
    vim.api.nvim_set_hl(0, "@function.macro", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@namespace", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@punctuation.special", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@keyword.storage", { link = "User2" })
    vim.api.nvim_set_hl(0, "@type.qualifier", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@variable", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@variable.builtin", { link = "String" })

    -- USER INTERFACE
    vim.api.nvim_set_hl(0, "ErrorMsg", { link = "Error" })
    vim.api.nvim_set_hl(0, "ModeMsg", { link = "Normal" })
    vim.api.nvim_set_hl(0, "MoreMsg", { link = "Normal" })
    vim.api.nvim_set_hl(0, "Question", { link = "Warning" })
    vim.api.nvim_set_hl(0, "WarningMsg", { link = "Warning" })

    vim.api.nvim_set_hl(0, "Conceal", { link = "Comment" })
    if bg == "light" then
        vim.api.nvim_set_hl(
            0,
            "Cursor",
            { fg = colors.accent, bg = colors.warning }
        )
    end
    vim.api.nvim_set_hl(0, "CursorLine", { link = "StatusLine" })
    vim.api.nvim_set_hl(0, "ColorColumn", { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Normal" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" })
    vim.api.nvim_set_hl(0, "Folded", { link = "NonText" })
    vim.api.nvim_set_hl(0, "LineNr", { link = "NonText" })
    vim.api.nvim_set_hl(0, "FoldColumn", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "VertSplit", { link = "NonText" })
    vim.api.nvim_set_hl(0, "Whitespace", { link = "NonText" })
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })

    vim.api.nvim_set_hl(0, "TabLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TabLineFill", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TabLineSel", { link = "Special" })

    vim.api.nvim_set_hl(0, "NvimInternalError", { link = "Error" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "NonText" })

    -- Diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
        fg = colors.none,
        bg = colors.none,
        underline = true,
        sp = colors.negative,
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
        fg = colors.none,
        bg = colors.none,
        underline = true,
        sp = colors.warning,
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
        fg = colors.none,
        bg = colors.none,
        underline = true,
    })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
        fg = colors.none,
        bg = colors.none,
        underline = true,
    })
    vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Error" })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "Warning" })
    vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "Comment" })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { link = "Comment" })
    vim.api.nvim_set_hl(0, "DiagnosticOk", { link = "String" })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Noise" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "User1" })
    vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "Noise" })

    -- Markdown
    vim.api.nvim_set_hl(
        0,
        "@markup.list.unchecked.markdown",
        { link = "Error" }
    )
    vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { link = "Number" })
    vim.api.nvim_set_hl(
        0,
        "@markup.link.label.markdown_inline",
        { link = "Special" }
    )
    vim.api.nvim_set_hl(
        0,
        "@markup.link.url.markdown_inline",
        { link = "Noise" }
    )

    -- diff

    local diff_add_bg = bg == "light" and colors.positive_light
        or colors.positive
    local diff_change_bg = bg == "light" and colors.changed_muted
        or colors.changed_muted
    local diff_delete_bg = bg == "light" and colors.ignore_hard
        or colors.negative_light

    vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.none, bg = diff_add_bg })
    vim.api.nvim_set_hl(
        0,
        "DiffChange",
        { fg = colors.none, bg = diff_change_bg }
    )
    vim.api.nvim_set_hl(
        0,
        "DiffDelete",
        { fg = colors.none, bg = diff_delete_bg }
    )

    vim.api.nvim_set_hl(0, "diffadded", { link = "DiffAdd" })
    vim.api.nvim_set_hl(0, "diffremoved", { link = "DiffDelete" })

    vim.api.nvim_set_hl(
        0,
        "Added",
        { fg = colors.accent, bg = colors.positive }
    )
    vim.api.nvim_set_hl(
        0,
        "Changed",
        { fg = colors.accent, bg = colors.changed_muted }
    )
    vim.api.nvim_set_hl(
        0,
        "Removed",
        { fg = colors.accent, bg = colors.negative_light }
    )

    -- GitSigns
    vim.api.nvim_set_hl(
        0,
        "GitSignsAdd",
        { fg = colors.positive, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "GitSignsChange",
        { fg = colors.warning, bg = colors.none }
    )
    vim.api.nvim_set_hl(
        0,
        "GitSignsDelete",
        { fg = colors.negative_light, bg = colors.none }
    )

    -- Fugitive
    vim.api.nvim_set_hl(0, "fugitiveUnstagedModifier", { link = "User3" })
    vim.api.nvim_set_hl(0, "fugitiveStagedHeading", { link = "Warning" })
    vim.api.nvim_set_hl(0, "fugitiveUntrackedHeading", { link = "User2" })
    vim.api.nvim_set_hl(0, "fugitiveUntrackedSection", { link = "Noise" })
    vim.api.nvim_set_hl(0, "fugitiveUntrackedModifier", { link = "Noise" })
end

load()
