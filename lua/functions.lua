local function word_count(opts)
    local start_line, end_line
    -- If a range is provided, use it. Otherwise, use the entire buffer
    if opts.range then
        start_line = opts.line1
        end_line = opts.line2
    else
        start_line = 1
        end_line = vim.api.nvim_buf_line_count(0)
    end

    -- Get the lines for the range or whole buffer
    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    local content = table.concat(lines, "\n")
    local count = select(2, content:gsub("%S+", ""))
    print("Word count: " .. count)
end

-- Define the command 'WordCount' that accepts an optional range
vim.api.nvim_create_user_command('WordCount', word_count, { range = "%" })
