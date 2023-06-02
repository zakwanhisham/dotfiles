# LUNARVIM CONFIG

- Use `pytholic/pytholic-lvim` on how he structured his lvim config.
- Change some thing, the only things on `config.lua` is `reload("user.config")`.
- The file tree is like this:

```
 .
├──  lua
│  └──  user
│     ├──  autocommands.lua
│     ├──  builtin.lua
│     ├──  colorscheme.lua
│     ├──  config.lua
│     ├──  formatter.lua
│     ├──  keymaps.lua
│     ├──  linter.lua
│     ├──  lualine.lua
│     ├──  nvimtree.lua
│     ├──  options.lua
│     ├──  plugins.lua
│     ├──  telescope.lua
│     └──  treesitter.lua
├──  config.lua
├──  lazy-lock.json
└──  README.md
```
