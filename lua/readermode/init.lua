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

	-- Define ways to toggle readermode
	vim.api.nvim_create_user_command("ReaderMode", require("readermode").toggle, {})
	vim.keymap.set({ "n" }, M.opts.keymap, M.toggle, { desc = M.opts.desc })

	local last_line = M.getCurrentLineNumber()

	-- Define Autocommand w/ new Autogroup
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		group = vim.api.nvim_create_augroup("ReaderMode", { clear = true }),
		callback = function()
			if M.opts.enabled then
				local current_line = M.getCurrentLineNumber()
				if current_line ~= last_line then
					M.center()
				else
				end
				last_line = current_line
			end
		end,
	})
end

---@return number
function M.getCurrentLineNumber()
	return vim.api.nvim_win_get_cursor(0)[1]
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
