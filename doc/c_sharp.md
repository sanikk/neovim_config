## Ok added these to get c_sharp support

#### lua/plugins/lsp.lua
[local_servers = {]
```lua
  omnisharp = {
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    -- You can add additional settings if you like, e.g.,
    -- enable_roslyn_analyzers = true,
    -- organize_imports_on_format = true,
    -- formatting_options = {},
    -- But defaults are usually enough
  },
```
[}]

#### lua/plugins/treesitter.lua
[ensure_installed = {
...
]
```lua
'c_sharp'
```
[...
}
]


