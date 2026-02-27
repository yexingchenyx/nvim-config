--return {
--  "akinsho/toggleterm.nvim",
--  version = "*",
--  config = true,
--}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  priority = 1000,
  config = function()
    -- 基础初始化
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = 20,
      direction = "horizontal",
      close_on_exit = true,
      single_instance = true,
    })

    -- 创建Python专属终端（ID=99）
    local Terminal = require("toggleterm.terminal").Terminal
    local py_term = Terminal:new({
      id = 99,
      hidden = true,
      direction = "horizontal",
      size = 25,
      on_open = function(term)
        -- 核心修改：ESC 直接隐藏终端（替代仅退出插入模式）
        vim.keymap.set("t", "<esc>", function()
          term:close() -- 隐藏终端窗口
        end, { buffer = term.bufnr, noremap = true, silent = true })

        -- 保留q键隐藏终端的备用方案
        --vim.keymap.set("t", "q", function()
        --  term:close()
        --end, { buffer = term.bufnr, noremap = true, silent = true })
      end,
    })

    -- 全局切换函数
    _G._py_term_toggle = function()
      py_term:toggle()
    end

    -- 绑定<leader>t（空格+t）切换终端
    vim.keymap.set("n", "<leader>t", "<cmd>lua _py_term_toggle()<CR>", {
      noremap = true,
      silent = false,
      desc = "Toggle Python Terminal",
    })

    -- Python文件中强化绑定
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        vim.keymap.set("n", "<leader>t", "<cmd>lua _py_term_toggle()<CR>", {
          buffer = true,
          noremap = true,
          desc = "Toggle Python Terminal",
        })
      end,
    })

    -- 兜底命令
    --vim.api.nvim_create_user_command("PyTerm", "_py_term_toggle()", { desc = "Open/Close Python Terminal" })
  end,
}
