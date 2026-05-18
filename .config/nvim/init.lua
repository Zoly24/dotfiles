-- 1. Bootstrap lazy.nvim FIRST
-- This ensures your plugin manager and all theme plugins are loaded before use
require("config.lazy")

-- 2. Define the Theme Loader Function
-- This replaces your old 'source_matugen' logic with a manual theme reader
local function source_manual_theme()
    local theme_file_path = os.getenv("HOME") .. "/.config/nvim/current_theme.txt"
    local file = io.open(theme_file_path, "r")

    if file then
        local theme_name = file:read("*l")
        file:close()

        -- Wrapped in an anonymous function to satisfy the LSP
        local ok, _ = pcall(function()
            vim.cmd("colorscheme " .. theme_name)
        end)

        if not ok then
            vim.cmd("colorscheme tokyonight")
            vim.notify("Theme '" .. theme_name .. "' not found. Using fallback.", vim.log.levels.WARN)
        end
    end
end

-- 3. The Signal Handler (Hot Reload)
-- This listens for SUPER+W (SIGUSR1) to refresh colors without restarting Neovim
vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    callback = function()
        source_manual_theme()
        -- Re-apply any custom highlights after the theme switch
        vim.api.nvim_set_hl(0, "Comment", { italic = true })
    end,
})

-- 4. Apply theme on startup
-- Using VimEnter ensures that LazyVim has finished loading its UI and plugins
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        source_manual_theme()
    end,
})
