fileline.nvim
===

Lua plugin to have better support around opening and copying filenames with line and column numbers.
The opening functionality is heavily inspired by https://github.com/bogado/file-line and its fork https://github.com/lervag/file-line.
Therefore, it is likely to suffer from similar issues to them.

# Installation
## [packer.nvim](https://github.com/lervag/file-line)
```lua
use {
  "triarius/fileline.nvim",
  config = function()
    require("fileline").setup(settings)
  end,
}
```
Here, `settings` is a table as outlined below.

# Settings
## Default settings
```lua
{
  copy = {
    destination_register = "+",
  },
}
```

# Usage
You can open a file at a line and column using colons:
```
nvim file:l:c
```
And you can copy the filename to clipboard with the `Fileline` command.
