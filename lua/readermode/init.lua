local M = {}

---@class ReaderModeOptions
---@field enabled? boolean
---@field keymap? string
---@field desc? string
---@field allow_filetypes? string[]
---@field denied_filetypes? string[]
local defaults = {
	enabled = false,
	keymap = "<leader>R",
	desc = "Toggle Reader Mode",
	allow_filetypes = {},
	denied_filetypes = {},
}

---@type ReaderModeOptions
M.opts = {}

---@param opts? ReaderModeOptions
function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", defaults, opts or {}) or {}

	-- Define ways to toggle readermode
	vim.api.nvim_create_user_command("ReaderMode", require("readermode").toggle, {})
	vim.keymap.set({ "n" }, M.opts.keymap, M.toggle, { desc = M.opts.desc })

	local last_line = M.getCurrentLineNumber()

	-- Define Autocommand w/ new Autogroup
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		group = vim.api.nvim_create_augroup("ReaderMode", { clear = true }),
		callback = function()
			local enabled = M.opts.enabled
			local allow_filetypes = M.opts.allow_filetypes
			---@cast allow_filetypes table
			local denied_filetypes = M.opts.denied_filetypes
			---@cast denied_filetypes table

			if enabled then
				local filetype = vim.bo.filetype

				-- denied filetypes contains filetype
				if vim.tbl_contains(denied_filetypes, filetype) then
					return
				end

				-- allow_filetypes is not empty and not contains filetype
				if vim.tbl_isempty(allow_filetypes) ~= true and vim.tbl_contains(allow_filetypes, filetype) then
					return
				end

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
