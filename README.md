# theme.nvim

A minimal, eye-friendly dark theme with subtle accents, designed for focus and
comfort during extended coding sessions. A Neovim colorscheme tailored for
readability and aesthetic consistency.

A fork of: [redbug312/cactusbuddy](https://github.com/redbug312/cactusbuddy),
built on
[tjdevries/colorbuddy.nvim](https://github.com/tjdevries/colorbuddy.nvim).

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "IlyasYOY/theme.nvim",
    dependencies = "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("ilyasyoy")
    end,
},
```

Then in your init.lua:

```lua
vim.cmd('colorscheme ilyasyoy')
```

## Features

- ✅ **TrueColor optimized** - Designed for modern terminals
- ✅ **Low contrast** - Gentle on the eyes during long sessions
- ✅ **Consistent syntax highlighting** - Cohesive color palette across
  languages
- ✅ **Terminal color support** - Seamless integration with your terminal
- ✅ **Plugin support** - Full integration with popular Neovim plugins

## Supported Plugins

- Diagnostics (LSP)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

## 🎨 Examples

See [Wiki: Examples](https://github.com/IlyasYOY/theme.nvim/wiki/Example) for
detailed screenshots and language-specific previews.

## Configuration

No additional configuration is required. The theme loads automatically when the
colorscheme is set.

## License

Licensed under the MIT License. See [LICENSE](./LICENSE) for details.
