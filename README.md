# theme.nvim

A minimal monochrome Neovim colorscheme designed for focus and readability.
It keeps syntax mostly neutral, uses restrained contrast, and supports both
dark and light backgrounds.

The exported colorscheme is `ilyasyoy-mono`.

<img width="1574" height="1026" alt="Screenshot 2026-07-09 at 22 02 07" src="https://github.com/user-attachments/assets/4aadde98-e92a-455d-95d5-0137268d89e9" />

<img width="1574" height="1026" alt="Screenshot 2026-07-09 at 22 02 36" src="https://github.com/user-attachments/assets/4b76836c-8462-403e-a9f7-97d1f6c06275" />

## Installation

### `vim.pack` built-in package manager

```lua
vim.pack.add {
    "https://github.com/IlyasYOY/theme.nvim",
}

vim.cmd.colorscheme "ilyasyoy-mono"
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "IlyasYOY/theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("ilyasyoy-mono")
    end,
},
```

Then in your init.lua:

```lua
vim.cmd('colorscheme ilyasyoy-mono')
```

## Features

- ✅ **TrueColor optimized** - Designed for modern terminals
- ✅ **Monochrome syntax** - Neutral syntax groups with emphasis from style, not hue
- ✅ **Light and dark backgrounds** - Uses `background` to select matching values
- ✅ **Terminal color support** - Seamless integration with your terminal
- ✅ **Plugin support** - Full integration with popular Neovim plugins

## Supported Plugins and Integrations

- Built-in LSP diagnostics
- Built-in diff, quickfix, popup menu, and spell highlights
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

## Configuration

No setup function is required. Set `vim.o.background` to `"dark"` or
`"light"` before loading the colorscheme when you want to force a variant;
otherwise Neovim uses its current background value.

### auto-dark-mode.nvim

`ilyasyoy-mono` has both light and dark palettes behind the same colorscheme
name. When using [auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim),
point both variants at `ilyasyoy-mono` and let the plugin update `background`:

```lua
require("auto-dark-mode").setup {
    dark_mode_colorscheme = "ilyasyoy-mono",
    light_mode_colorscheme = "ilyasyoy-mono",
}
```

## License

Licensed under the MIT License. See [LICENSE](./LICENSE) for details.
