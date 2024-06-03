local M = {}

---@class ReaderModeOptions
local defaults = {
	enabled = false,
	keymap = "<leader>R",
	desc = "Toggle Reader Mode",
}

---@type ReaderModeOptions
M.opts = {}

---@param opts? ReaderModeOptions
function M.setup(opts)
	M.opts = opts or defaults
	vim.keymap.set({ "n" }, M.opts.keymap, M.toggle, { desc = M.opts.desc })
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		group = vim.api.nvim_create_augroup("ReaderMode", { clear = true }),
		callback = function()
			if M.opts.enabled then
				M.center()
			end
		end,
	})
end

---@return nil
function M.toggle()
	M.opts.enabled = not M.opts.enabled
	if M.opts.enabled == true then
		M.center()
	end
end

---@return nil
function M.center()
	vim.cmd("normal! zz")
end

return M
