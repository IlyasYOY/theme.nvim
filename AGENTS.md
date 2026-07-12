# theme.nvim Agent Guidelines

## Repository Shape

- `colors/ilyasyoy-mono.lua` is the zero-setup colorscheme loader and public
  runtime contract. Do not move it behind a setup function.
- `lua/theme/health.lua` implements `:checkhealth theme`.
- Specs are colocated under `lua/theme/*_spec.lua`; the dependency-free runner
  and isolated bootstrap live under `tests/`.
- User documentation lives in `README.md` and `doc/theme.txt`.

## Commands

- `make test` runs runtime and health specs with isolated XDG directories.
- `make test-verbose` prints successful test names.
- `make format` formats `colors/`, `lua/`, and `tests/` with StyLua.
- `make lint` runs Luacheck and StyLua checks.
- `make help-check` validates the tracked Vim help tags.
- `make check` is the canonical non-mutating verification target.

Use `NVIM_VERSION=v0.11.7`, `v0.12.4`, or `nightly` to run against a downloaded
Neovim build. Run `make help-tags` after changing help tags.

## Runtime Compatibility

- Preserve the colorscheme name `ilyasyoy-mono`, dark/light selection through
  `background`, `g:colors_name`, and the zero-setup loading behavior.
- Prefer additions or focused highlight changes over runtime restructuring.
- Test both backgrounds and representative core/plugin groups when changing
  palette values or links.
- Health checks must report optional or inactive state without preventing the
  colorscheme from loading.

## Style and Workflow

- Use four spaces, 80 columns, double quotes where practical, and the repository
  `stylua.toml`, `.editorconfig`, and `.luacheckrc` settings.
- Keep README and Vim help behavior aligned.
- Do not make commits, tags, releases, or remote changes unless explicitly
  requested. Releases are manual through `.github/workflows/release.yml`.
- Preserve unrelated worktree changes and report verification performed.
