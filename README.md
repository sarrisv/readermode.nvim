# readermode.nvim

Simple neovim plugin for keeping your cursor centered while reading through code/text/whatever

https://github.com/user-attachments/assets/d9bd8a00-54cd-4264-83a8-2ad4d82d64dc

## Requirements

- Neovim v0.7.0+

## Setup

### lazy.nvim

```lua
{
  'sarrisv/readermode.nvim',
  opts = { --[[ Configurations Options ]] }
}
```

### Configuration

```lua
  {
    enabled = false, -- Turned off by default
    keymap = "<leader>R" -- Keymap used to toggle ReaderMode on/off
  }
```

## Usage

Toggle **ReaderMode** using `:ReaderMode` or the provided _normal mode_ keymapping

## Credits

Inspired by [this](https://stackoverflow.com/a/63326139) stackoverflow answer from user [pip](https://stackoverflow.com/users/8096230/pip)
