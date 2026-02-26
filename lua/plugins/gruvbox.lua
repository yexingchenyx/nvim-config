return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- 纯默认配置（不传入任何 opts）
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true, -- 字符串默认斜体
          comments = true, -- 注释默认斜体
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- 核心：默认启用暗模式（背景深、前景浅）
        contrast = "", -- 空值 = 默认中等对比度（非 hard/soft）
        palette_overrides = {}, -- 不覆盖原生调色板
        overrides = {}, -- 不覆盖任何高亮组
        dim_inactive = false, -- 非活动窗口不变暗
        transparent_mode = false, -- 不透明背景
      })

      -- 启用默认主题
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
