local lsp = {
  function()
    local msg = "No Active LSP"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return string.format("[%s]",client.name)
      end
    end
    return msg
  end
}

local location = {
  "location",
  padding = {
    right = 1,
    left = 0,
  },
}

local branch = {
  "branch",
  icons_enabled = false,
  padding = {
    right = 1,
    left = 1,
  },

}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { "diff", "%=", { "filename" } },
    lualine_x = { "diagnostics", lsp },
    lualine_y = { "filetype" },
    lualine_z = { location }
  },
}
