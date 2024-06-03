# readermode.nvim

Simple neovim plugin for keeping your cursor centered

--- insert demo here

## Setup

```lua
{
  'sarrisv/readermode.nvim'
}
```

## Usage

Turned off by default, toggle reader mode with a keymap to enable / disable

Default Keymap:

```lua
vim.keymap.set({ "n", "i" }, M.opts.keymap, M.toggle, { silent = true })
```

## Credits

Based on [this](https://stackoverflow.com/a/63326139) stackoverflow answer from user [pip](https://stackoverflow.com/users/8096230/pip)
