require("config.lazy")

local function apply_matugen_theme()
    local generated_path = vim.fn.stdpath("config") .. "/generated.lua"
    local file = io.open(generated_path, "r")
    if file then
        file:close()
        dofile(generated_path)
    end
end

vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    callback = function()
        apply_matugen_theme()
        vim.api.nvim_set_hl(0, "Comment", { italic = true })
        pcall(vim.cmd.LualineRefresh)
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        apply_matugen_theme()
    end,
})
