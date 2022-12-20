-- import comment plugin safely
local setup, bufferline = pcall(require, "bufferline")
if not setup then
  return
end

local keymap = vim.keymap

-- enable comment
bufferline.setup {
  options = {
    numbers = "both",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
        separator = true
      }
    },
  }
}

keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { silent = true })
keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { silent = true })
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
