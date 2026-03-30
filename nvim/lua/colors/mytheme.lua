local M = {}

function M.setup()
  -- ハイライト設定を書く
  vim.opt.background = "light"
  -- 基本背景・カーソルライン
  vim.api.nvim_set_hl(0, "Normal", { fg = "#06060C", bg = "#fdf0ed" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#fce5de" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#817b7c", bg = "#fdf0ed" })
  vim.api.nvim_set_hl(0, "Cursor", { fg = "#FDF0ED", bg = "#E84A72" })
  vim.api.nvim_set_hl(0, "CursorI", { fg = "#E84A72", bg = "#E84A72" })
  vim.api.nvim_set_hl(0, "CursorR", { fg = "#E84A72", bg = "#FDF0ED" })
  vim.api.nvim_set_hl(0, "Visual", { bg = "#fce5de"} ) 

    -- 標準ハイライト
  vim.api.nvim_set_hl(0, "Comment", { fg = "#333333", italic = true })
  vim.api.nvim_set_hl(0, "Constant", { fg = "#DC3318" })
  vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#1D8991" })
  vim.api.nvim_set_hl(0, "Search", {fg = "#FDF0ED", bg = "#f18c9b"})
  vim.api.nvim_set_hl(0, "Identifier", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "Function", { fg = "#1D8991" })
  vim.api.nvim_set_hl(0, "Tag", { fg = "#DA103F", bold = true })
  vim.api.nvim_set_hl(0, "Type", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "Label", { fg = "#DC3318", bold = true })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#8A31B9", bold = true })
  vim.api.nvim_set_hl(0, "Operator", { fg = "#333333" })
  vim.api.nvim_set_hl(0, "Title", { fg = "#DA103F" })
  vim.api.nvim_set_hl(0, "Bold", { fg = "#8A31B9", bold = true })
  vim.api.nvim_set_hl(0, "Italic", { fg = "#1D8991", italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = "#F6661E" })
  vim.api.nvim_set_hl(0, "StorageClass", { fg = "#8A31B9", bold = true })
  vim.api.nvim_set_hl(0, "Underlined", { fg = "#F6661E" })
  vim.api.nvim_set_hl(0, "Special", { fg = "#333333" })
  -- vim.api.nvim_set_hl(0, "Delimiter", { fg = "#0431fa" })
  vim.api.nvim_set_hl(0, "Include", { fg = "#F77D26", bold = true })

  -- Tree-sitter ハイライト
  vim.api.nvim_set_hl(0, "@module", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "@function", { fg = "#1D8991" })
  vim.api.nvim_set_hl(0, "@variable", { fg = "#DA103F" })
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#F77D26", italic = true })
  vim.api.nvim_set_hl(0, "@constant", { fg = "#DC3318" })
  vim.api.nvim_set_hl(0, "@type", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "@string", { fg = "#F6661E" })
  vim.api.nvim_set_hl(0, "@comment", { fg = "#989290", italic = true })
  vim.api.nvim_set_hl(0, "@operator", { fg = "#333333" })
  vim.api.nvim_set_hl(0, "@keyword", { fg = "#8A31B9", bold = true })
  vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#8A31B9", bold = true })  -- use / require
  vim.api.nvim_set_hl(0, "@keyword.namespace", { fg = "#8A31B9", bold = true }) -- namespace
  vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#333333", bold = true }) -- namespace
  vim.api.nvim_set_hl(0, "@namespace", { fg = "#F77D26" }) -- 名前空間名
  vim.api.nvim_set_hl(0, "@function.call", { fg = "#1D8991" })
  vim.api.nvim_set_hl(0, "@parameter", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "@property", { fg = "#F77D26" })
  vim.api.nvim_set_hl(0, "@boolean", { fg = "#DC3318" })
  vim.api.nvim_set_hl(0, "@number", { fg = "#DC3318" })
  vim.api.nvim_set_hl(0, "@constructor", { fg = "#1D8991" })
  vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#0431fa" })  -- ()
  vim.api.nvim_set_hl(0, "@punctuation.brace", { fg = "#0431fa" })    -- {}
  vim.api.nvim_set_hl(0, "@punctuation.square", { fg = "#0431fa" })   -- []


  -- アクティブなウィンドウのステータスライン
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#E84A72", bg = "#f9eae5" })
  -- 非アクティブなウィンドウのステータスライン
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#AAAAAA", bg = "#f9eae5" })
  -- コマンドラインやメッセージ表示の背景と文字色
  vim.api.nvim_set_hl(0, "MsgArea", { fg = "#E84A72", bg = "#f9eae5", italic = true })
  -- モードメッセージ（INSERT, VISUAL など）の色
  vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#E84A72", bg = "#f9eae5"})
  -- 非アクティブタブ
  vim.api.nvim_set_hl(0, "TabLine", { fg = "#817b7c", bg = "#f9eae5" })
  -- アクティブタブ
  vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#333333", bg = "#fdf0ed", bold = true })
  -- タブの余白部分
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#f9eae5" })

  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#FFFFFF", bg = "#fdf0ed" })
end

return M
