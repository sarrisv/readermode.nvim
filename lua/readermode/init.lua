local M = {}

---@param bool? boolean
---@return nil
function M.toggle(bool)
	M.enabled = bool and not M.enabled or bool
end

---@return nil
function M.center()
	vim.cmd("normal! zz")
end

---@class ReaderModeOptions
local defaults = {
	enabled = false,
	keymap = "<leader>R",
}

---@type ReaderModeOptions
M.opts = {}

---@param opts? ReaderModeOptions
function M.setup(opts)
	M.opts = opts or defaults

	vim.keymap.set({ "n", "i" }, M.opts.keymap, M.toggle, { silent = true })

	vim.api.nvim_create_autocmd({ "CursoMoved", "CursorMovedI" }, {
		group = vim.api.nvim_create_augroup("ReadeMode", { clear = true }),
		callback = function()
			if M.opts.enabled then
				M.center()
			end
		end,
	})
end

return M
