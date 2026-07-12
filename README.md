# theme.nvim

A minimal monochrome Neovim colorscheme designed for focus and readability.
It uses restrained contrast and supports dark and light backgrounds behind the
single `ilyasyoy-mono` colorscheme name.

<img width="1574" height="1026" alt="Dark theme screenshot" src="https://github.com/user-attachments/assets/4aadde98-e92a-455d-95d5-0137268d89e9" />

<img width="1574" height="1026" alt="Light theme screenshot" src="https://github.com/user-attachments/assets/4b76836c-8462-403e-a9f7-97d1f6c06275" />

## Requirements

- Neovim 0.11 or newer
- a terminal or GUI with true-color support

## Installation

Neovim 0.11 users should install the plugin with lazy.nvim or another plugin
manager. Neovim's built-in `vim.pack` requires Neovim 0.12 or newer.

With Neovim 0.12+'s built-in `vim.pack`:

```lua
vim.pack.add {
    { src = "https://github.com/IlyasYOY/theme.nvim" },
}
vim.cmd.colorscheme "ilyasyoy-mono"
```

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "IlyasYOY/theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "ilyasyoy-mono"
    end,
}
```

## Configuration

No setup function is required. Set `vim.o.background` before loading the
colorscheme to select its dark or light palette:

```lua
vim.o.background = "dark"
vim.cmd.colorscheme "ilyasyoy-mono"
```

When using [auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim),
point both variants at the same colorscheme:

```lua
require("auto-dark-mode").setup {
    dark_mode_colorscheme = "ilyasyoy-mono",
    light_mode_colorscheme = "ilyasyoy-mono",
}
```

## Highlights and integrations

The colorscheme sets `g:colors_name`, enables `termguicolors`, and defines core
editor, syntax, Tree-sitter, LSP diagnostic, diff, quickfix, popup-menu, spell,
and terminal colors. It also includes groups for fzf-lua, Oil, and Fugitive.

The public runtime contract is the standard command:

```vim
:colorscheme ilyasyoy-mono
```

## Health

Run `:checkhealth theme` to verify the Neovim version, runtime colors file,
active palette, true-color setting, and representative core/plugin highlights.
Vim help is available with `:help theme.nvim`.

## Development

Run `make check` for the canonical non-mutating lint, dark/light runtime tests,
health tests, and Vim-help validation. Supported releases can be exercised with
`make test NVIM_VERSION=v0.11.7` and `make test NVIM_VERSION=v0.12.4`;
nightly is an additional compatibility probe.

## License

Apache-2.0. See [LICENSE](LICENSE).
