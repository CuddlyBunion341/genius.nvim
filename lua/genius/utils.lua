local M = {}

local opts = require'genius.config'

function M.report(msg)
    if opts.report_error then
        vim.notify(msg, vim.log.levels.ERROR, {title = 'Genius'})
    end
end

function M.dump(x)
    if type(x) ~= 'string' then
        x = vim.inspect(x)
    end
    local file = io.open(opts.log_path or "/tmp/neovim.log", "a")
    if file then
        file:write('\n=======\n')
        file:write(x)
        file:close()
    end
end

return M
