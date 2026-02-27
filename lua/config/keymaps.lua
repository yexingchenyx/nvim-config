-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazy.core.util")

-- 封装 LazyVim 风格的映射函数（兼容 LazyVim 内置逻辑）
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- 核心：插入模式 jk 映射为 Esc
map("i", "jk", "<Esc>", {
  noremap = true, -- 禁止递归映射（LazyVim 推荐显式声明）
  desc = "Map jk to <Esc> in insert mode", -- 描述会被 which-key 识别
})

-- 可选：命令行模式也支持 jk → Esc（LazyVim 终端/命令行常用）
map("c", "jk", "<Esc>", {
  noremap = true,
  desc = "Map jk to <Esc> in command mode",
})

-- 可选：调整按键超时（解决 jk 触发延迟，LazyVim 默认 timeoutlen 是 1000ms）
vim.o.timeoutlen = 150

-- 可选：打印生效提示（LazyVim 风格的日志输出）
--Util.info("Mapped jk to <Esc> successfully", { title = "Keymaps" })
