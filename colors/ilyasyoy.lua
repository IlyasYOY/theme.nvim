-- setup colors
local palette = {
    { keys = { "negative_light" }, dark = "#722529" },
    { keys = { "negative" }, dark = "#d75f5f" },

    { keys = { "positive_strong" }, dark = "#5f875f" },
    { keys = { "positive" }, dark = "#416241" },
    { keys = { "positive_light" }, dark = "#87af87" },

    { keys = { "warning" }, dark = "#d7875f" },
    { keys = { "warning_deep" }, dark = "#af875f" },
    { keys = { "warning_deeper" }, dark = "#875f5f" },

    { keys = { "interesting" }, dark = "#5f87af" },
    { keys = { "interesting_dark" }, dark = "#3b4050" },

    { keys = { "highlight" }, dark = "#d787af" },
    { keys = { "special" }, dark = "#8787af" },

    -- Grayscale
    { keys = { "accent" }, dark = "#bcbcbc" },
    { keys = { "accent_light" }, dark = "#949494" },
    { keys = { "ignore_light" }, dark = "#767676" },
    { keys = { "ignore" }, dark = "#585858" },
    { keys = { "ignore_hard" }, dark = "#444444" },
    { keys = { "over_bg" }, dark = "#262626" },
    { keys = { "changed_muted" }, dark = "#333333" },
    { keys = { "bg" }, dark = "#000000" },
}

local function load()
    local bg = vim.o.background
    local colorbuddy = require "colorbuddy"
    colorbuddy.colorscheme "ilyasyoy"

    local Color = colorbuddy.Color
    local Group = colorbuddy.Group
    local c = colorbuddy.colors
    local g = colorbuddy.groups
    local s = colorbuddy.styles

    for _, value in ipairs(palette) do
        for _, key in ipairs(value.keys) do
            if bg == "light" then
                Color.new(key, value.light or value.dark)
            elseif bg == "dark" then
                Color.new(key, value.dark or value.light)
            end
        end
    end

    -- EDITOR BASICS
    -- https://neovim.io/doc/user/syntax.html#group-name

    -- Custom groups
    Group.new("Noise", c.ignore_light, c.none, s.none)

    -- Basic groups
    Group.new("Comment", c.ignore, c.none, s.none)
    Group.new("NormalFloat", g.Normal)
    Group.new("Normal", c.accent, c.bg, s.none)

    Group.new("NonText", c.ignore_hard, c.none, s.none)
    Group.new("Error", c.negative, c.none, s.none)
    Group.new("Number", c.positive_light, c.none, s.none)
    Group.new("Special", c.special, c.none, s.none)
    Group.new("String", c.positive_strong, c.none, s.none)
    Group.new("Title", c.interesting, c.none, s.none)
    Group.new("Todo", c.positive, c.none, s.none)

    Group.new("Warning", c.warning, c.none, s.none)

    -- https://neovim.io/doc/user/syntax.html#hl-User1
    Group.new("User1", c.warning_deep, c.none, s.none)
    Group.new("User2", c.interesting, c.none, s.none)
    Group.new("User3", c.warning_deeper, c.none, s.none)

    -- search and highlight stuff
    Group.new("MatchParen", c.Normal, c.none, s.underline)

    Group.new("CurSearch", c.highlight, c.none, s.underline)
    Group.new("IncSearch", c.highlight, c.none, s.none)
    Group.new("Search", c.highlight, c.none, s.none)

    Group.new("Pmenu", c.ignore_light, c.over_bg, s.none)
    Group.new("PmenuSel", c.accent_light, c.bg, s.underline)

    Group.new("PmenuThumb", c.warning_deep, c.over_bg, s.none) -- not sure what this is
    Group.new("WildMenu", c.highlight, c.over_bg, s.none)

    Group.new("StatusLine", c.none, c.over_bg, s.none)
    Group.new("StatusLineNC", c.bg, c.none, s.none)

    Group.new("Visual", c.interesting, c.over_bg, s.none)
    Group.new("VisualNOS", c.interesting, c.over_bg, s.none)

    Group.new("qffilename", g.Title, g.Title, g.Title)

    -- spelling problesm are shown!
    Group.new("SpellBad", c.negative, c.none, s.undercurl)
    Group.new("SpellCap", c.warning, c.none, s.undercurl)
    Group.new("SpellLocal", c.warning_deep, c.none, s.undercurl)
    Group.new("SpellRare", c.interesting, c.none, s.undercurl)

    -- LINKS
    Group.new("Constant", g.Normal)
    Group.link("Boolean", g.Number)
    Group.link("Character", g.Number)
    Group.new("Conditional", g.Normal)
    Group.link("Debug", g.Todo)
    Group.link("Delimiter", g.Noise)
    Group.link("Directory", g.String)
    Group.new("Exception", g.Normal)
    Group.link("Function", g.Special)
    Group.new("Identifier", g.Normal)
    Group.new("Include", g.Normal)
    Group.link("Keyword", g.Noise)
    Group.new("Label", g.Normal, c.none, g.Normal + s.bold)
    Group.link("Macro", g.User2)
    Group.link("Operator", g.Noise)
    Group.new("PreProc", g.Normal)
    Group.new("Repeat", g.Normal)
    Group.link("SpecialChar", g.Special)
    Group.link("SpecialKey", g.Special)
    Group.new("Statement", g.Normal)
    Group.new("StorageClass", g.Normal)
    Group.new("Structure", g.Normal)
    Group.new("Tag", g.Normal)
    Group.link("Type", g.User3)
    Group.link("TypeDef", g.User3)

    -- treesitter stuff
    Group.link("@type.builtin", g.User3)
    Group.link("@constant.builtin", g.User1)
    Group.link("@constructor", g.Special)
    Group.link("@exception.operator", g.Special)
    Group.new("@function.macro", g.Normal)
    Group.new("@namespace", g.Normal)
    Group.new("@punctuation.special", g.Normal)
    Group.link("@keyword.storage", g.User2)
    Group.new("@type.qualifier", g.Normal)
    Group.new("@variable", g.Normal)
    Group.link("@variable.builtin", g.String)

    -- USER INTERFACE
    Group.link("ErrorMsg", g.Error)
    Group.new("ModeMsg", g.Normal)
    Group.new("MoreMsg", g.Normal)
    Group.link("Question", g.Warning)
    Group.link("WarningMsg", g.Warning)

    Group.link("Conceal", g.Comment)
    Group.link("CursorLine", g.StatusLine)
    Group.link("ColorColumn", g.CursorLine)
    Group.new("CursorLineNr", g.Normal)
    Group.link("EndOfBuffer", g.NonText)
    Group.link("Folded", g.NonText)
    Group.link("LineNr", g.NonText)
    Group.link("FoldColumn", g.LineNr)
    Group.link("SignColumn", g.LineNr)
    Group.link("VertSplit", g.NonText)
    Group.link("Whitespace", g.NonText)
    Group.link("WinSeparator", g.NonText)

    Group.new("TabLine", g.Normal)
    Group.new("TabLineFill", g.Normal)
    Group.link("TabLineSel", g.Special)

    Group.link("NvimInternalError", g.Error)
    Group.link("FloatBorder", g.NonText)

    -- Diagnostics
    Group.new(
        "DiagnosticUnderlineError",
        c.none,
        c.none,
        s.underline,
        c.negative
    )
    Group.new("DiagnosticUnderlineWarn", c.none, c.none, s.underline, c.warning)
    Group.new("DiagnosticUnderlineHint", c.none, c.none, s.underline)
    Group.new("DiagnosticUnderlineInfo", c.none, c.none, s.underline)
    Group.link("DiagnosticError", g.Error)
    Group.link("DiagnosticWarn", g.Warning)
    Group.link("DiagnosticHint", g.Comment)
    Group.link("DiagnosticInfo", g.Comment)
    Group.link("DiagnosticOk", g.String)

    -- Telescope
    Group.link("TelescopeBorder", g.Noise)
    Group.link("TelescopeMatching", g.User1)
    Group.link("TelescopePromptCounter", g.Noise)

    -- Markdown
    Group.link("@markup.list.unchecked.markdown", g.Error)
    Group.link("@markup.list.checked.markdown", g.Number)
    Group.link("@markup.link.label.markdown_inline", g.Special)
    Group.link("@markup.link.url.markdown_inline", g.Noise)

    -- diff

    Group.new("DiffAdd", c.none, c.positive, s.none)
    Group.new("DiffChange", c.none, c.changed_muted, s.none)
    Group.new("DiffDelete", c.none, c.negative_light, s.none)

    Group.link("diffadded", g.DiffAdd)
    Group.link("diffremoved", g.DiffDelete)

    Group.new("Added", g.Normal, c.positive, s.none)
    Group.new("Changed", g.Normal, c.changed_muted, s.none)
    Group.new("Removed", g.Normal, c.negative_light, s.none)

    -- GitSigns
    Group.new("GitSignsAdd", c.positive, c.none, s.none)
    Group.new("GitSignsChange", c.warning, c.none, s.none)
    Group.new("GitSignsDelete", c.negative_light, c.none, s.none)

    -- Fugitive
    Group.link("fugitiveUnstagedModifier", g.TypeDef)
    Group.link("fugitiveStagedHeading", g.Warning)
    Group.link("fugitiveUntrackedHeading", g.Macro)
    Group.link("fugitiveUntrackedSection", g.Noise)
    Group.link("fugitiveUntrackedModifier", g.Noise)
end

load()
