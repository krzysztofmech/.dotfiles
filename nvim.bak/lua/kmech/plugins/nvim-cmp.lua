local setup, cmp = pcall(require, "cmp")
local lspkind_setup, lspkind = pcall(require, "lspkind")
if not setup or not lspkind_setup then
  return
end
cmp.setup({
  sources = {
    {name = "nvim_lsp"},
    {name = "buffer"},
    {name = "luasnip"},
    {name = "nvim_lsp"},
  },
  mapping = {
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({select = false}),
    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Up>"] = cmp.mapping.select_prev_item({behavior = "select"}),
    ["<Down>"] = cmp.mapping.select_next_item({behavior = "select"}),
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({behavior = "nsert"})
      else
        cmp.complete()
      end
    end),
    ["<C-n>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({behavior = "insert"})
      else
        cmp.complete()
      end
    end),
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                     -- can also be a function to dynamically calculate max width such as 
                     -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
})
