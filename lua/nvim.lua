require("mason").setup({})

require("lsp")

require("cmp_complete")

require("lualine").setup({
  options = {
    theme = "tokyonight"
  },
  sections = {
    lualine_c = {
      { "filename", file_status=true, path=1 }
    },
  },
})

require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "<space>r",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    ["."] = false,
  },
})

require("ibl").setup()

vim.o.timeout = true
vim.o.timeoutlen = 500
require("which-key").setup()

require("nvim-treesitter").install({
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "python",
  "cpp",
  "bash",
})

-- Start treesitter highlighting for any filetype that has a parser installed.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

require("toggleterm").setup({
  open_mapping = [[<c-\>]],
})

require("trouble").setup({})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, desc = "Workspace Diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { silent = true, desc = "Buffer Diagnostics" })

local fff_ok, fff = pcall(require, "fff")
if fff_ok then
  fff.setup({})
  vim.keymap.set("n", "ff", function() require("fff").find_files() end, { desc = "Find files" })
  vim.keymap.set("n", "fg", function() require("fff").live_grep() end, { desc = "Live grep" })
  vim.keymap.set("n", "fc", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, { desc = "Grep current word" })
end

require("render-markdown").setup({
  file_types = { "markdown" },
})
