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
vim.o.shiftwidth = 4    -- インデント幅2スペース
vim.o.tabstop = 4       -- タブ幅2スペース
vim.o.smartindent = true -- インデント自動調整

vim.o.hlsearch = true   -- 検索結果ハイライト
vim.o.incsearch = true  -- インクリメンタル検索

vim.o.clipboard = "unnamedplus"
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


require("lazy").setup({
{
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
--   config = function()
--     require("nvim-treesitter.configs").setup({
--       ensure_installed = { "go", "lua", "javascript", "html", "css", "php" }, -- インストールする言語
--       highlight = {
--         enable = true,  -- ハイライトを有効化
--         additional_vim_regex_highlighting = false, -- Vimの正規表現ハイライトは無効化
--       },
--     })
--   end,
},


--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v3.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons",
--       "MunifTanjim/nui.nvim",
--     },
--     config = function()
--       require("neo-tree").setup({
--         follow_current_file = {
--           enabled = true,
--           leave_dirs_open = false,
--         },
--         window = {
--           position = "left",
--           width = 30,
--         },
--       })
--     end,
--   },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
  callback = function(ctx)
    -- 必要に応じて`ctx.match`に入っているファイルタイプの値に応じて挙動を制御
    -- `pcall`でエラーを無視することでパーサーやクエリがあるか気にしなくてすむ
    pcall(vim.treesitter.start)
  end,
})