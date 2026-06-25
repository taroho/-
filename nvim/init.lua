-- ~/.config/nvim/init.lua

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ここに Lua の設定を書く
require("colors.mytheme").setup()

-- ほかの設定もここに追記していく
vim.o.number = true  -- 行番号表示
vim.o.expandtab = true  -- タブはスペースに変換
vim.o.shiftwidth = 2    -- インデント幅2スペース
vim.o.tabstop = 2       -- タブ幅2スペース
vim.o.smartindent = true -- インデント自動調整

vim.o.hlsearch = true   -- 検索結果ハイライト
vim.o.incsearch = true  -- インクリメンタル検索

vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = [[powershell.exe -NoProfile -Command "(Get-Clipboard) -replace \"`r\", \"\""]],
    ["*"] = [[powershell.exe -NoProfile -Command "(Get-Clipboard) -replace \"`r\", \"\""]],
  },
  cache_enabled = 0,
}
vim.o.termguicolors = true  -- 24bitカラーを有効に
-- カラースキームは好きなものをセット
vim.o.laststatus = 2
vim.o.autoread = true
vim.o.smarttab = true
vim.o.completeopt = "menuone,noselect"  -- 補完メニューの挙動改善
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.guicursor = table.concat({
    "n-v-c-r-cr:block-Cursor",       -- normal, visual, command , rはブロック
    "i-ci-ve:ver30-CursorI",   -- insert は縦棒
}, ",")
vim.o.list = true
vim.opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}
vim.opt.listchars:append("lead:·")



require("lazy").setup({
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "lua", "javascript", "typescript", "tsx", "python", "java",
      })

      -- 対象ファイルタイプでハイライトを有効化
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "javascript", "typescript", "typescriptreact", "python", "java" },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      vim.cmd([[highlight IndentRed guifg=#e06c75]])
      vim.cmd([[highlight IndentYellow guifg=#e5c07b]])
      vim.cmd([[highlight IndentBlue guifg=#61afef]])
      vim.cmd([[highlight IndentGreen guifg=#98c379]])
      vim.cmd([[highlight IndentViolet guifg=#c678dd]])
      vim.cmd([[highlight IndentCyan guifg=#56b6c2]])

      require("ibl").setup({
        indent = {
          highlight = {
            "IndentRed",
            "IndentYellow",
            "IndentBlue",
            "IndentGreen",
            "IndentViolet",
            "IndentCyan",
          },
        },
        scope = {
          enabled = true,
        },
      })
    end
  },
})
