<div align="center">

# Min Theme

A port of [Min Theme](https://github.com/miguelsolorio/min-theme) for Neovim.

<br/>
<br/>

![preview-dark](https://user-images.githubusercontent.com/76636791/235570903-edfbd62e-3908-4f5b-ae03-4b9945d58020.png) 

<br/>
<br/>

</div>

## Installation

1. Using `Lazy`:

```lua
{ 'datsfilipe/min-theme.nvim' },
```

2. Using `Packer`:

```lua
use 'datsfilipe/min-theme.nvim'
```

## Configuration

To configure the plugin, you can call require('min-theme').setup({}), passing the table with the values in it, the following are the **defaults**:

```lua
require('min-theme').setup({
    theme = 'dark', -- String: 'dark' or 'light', determines the colorscheme used (obs: if your config sets vim.o.background, this will do nothing)
    transparent = false, -- Boolean: Sets the background to transparent
    italics: {
        comments = true, -- Boolean: Italicizes comments
        keywords = true, -- Boolean: Italicizes keywords
        functions = true, -- Boolean: Italicizes functions
        strings = true, -- Boolean: Italicizes strings
        variables = true, -- Boolean: Italicizes variables
    },
    overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
})
```

## Contributing

Contributions are welcome, please open an issue if you encounter any bug and also feel free to open a PR.

## License

[MIT License](LICENSE) 
