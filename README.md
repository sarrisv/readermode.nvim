# readermode.nvim

Simple neovim plugin for keeping your cursor centered while reading through code/text/whatever

![readermode.gif](readermode.gif)

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

Toggle **ReaderMode** using `:ReaderMode` or the provided *normal mode* keymapping

## Credits

Inspired by [this](https://stackoverflow.com/a/63326139) stackoverflow answer from user [pip](https://stackoverflow.com/users/8096230/pip)
