local M = {}

local api = vim.api

local buffers, windows = {}, {}
local size = 0.9
local window_currently_opened = false

function M.get_float_config()
  local ui_info = api.nvim_list_uis()[1]
  local width = math.floor(ui_info.width * size)
  local height = math.floor(ui_info.height * size)
  local border = 'rounded'
  if size == 1 then
    border = 'none'
  end
  return {
    relative = 'editor',
    width = width,
    height = height,
    row = (ui_info.height - height) * 0.5 - 1,
    col = (ui_info.width - width) * 0.5,
    style = 'minimal',
    border = border,
  }
end

function M.open_window(process)
  windows[process] = api.nvim_open_win(buffers[process], true, M.get_float_config())
end

function M.create_window(process)
  local termplug_augroup = api.nvim_create_augroup('termplug_' .. process, { clear = true })
  local term_buffer = buffers[process]
  if not api.nvim_buf_is_valid(term_buffer) then
    return
  end

  api.nvim_create_autocmd('TermClose', {
    buffer = term_buffer,
    group = termplug_augroup,
    callback = function()
      local t_buffer = buffers[process]
      if api.nvim_get_current_buf() ~= t_buffer then
        return
      end

      if api.nvim_buf_is_valid(t_buffer) then
        api.nvim_buf_delete(t_buffer, { force = true })
      end

      local t_window = windows[process]
      if api.nvim_win_is_valid(t_window) then
        api.nvim_win_close(t_window, true)
      end

      window_currently_opened = false
    end,
  })

  api.nvim_create_autocmd('VimResized', {
    buffer = term_buffer,
    group = termplug_augroup,
    callback = function()
      local t_window = windows[process]
      if not api.nvim_win_is_valid(t_window) then
        return
      end

      api.nvim_win_set_config(t_window, M.get_float_config())
    end,
  })

  M.open_window(process)
end

function M.toggle(process)
  if process == nil then
    process = 'bash'
  end
  local t_buffer = buffers[process]
  if t_buffer == nil or not api.nvim_buf_is_valid(t_buffer) then
    if window_currently_opened == true then
      return
    end

    local new_buf = api.nvim_create_buf(false, true)
    buffers[process] = new_buf
    M.create_window(process)
    vim.fn.termopen(process)
    vim.cmd 'startinsert'
    window_currently_opened = true
  else
    if api.nvim_get_current_buf() == t_buffer then
      if window_currently_opened == false then
        return
      end

      api.nvim_win_close(windows[process], true)
      window_currently_opened = false
    else
      if window_currently_opened == true then
        return
      end

      M.open_window(process)
      vim.cmd 'startinsert'
      window_currently_opened = true
    end
  end
end

function M.setup(opts)
  opts = opts or {}

  size = opts.size or size

  api.nvim_create_user_command('Term', function(input)
    local process = input.args
    if #process == 0 then
      process = nil
    end
    M.toggle(process)
  end, { force = true, nargs = '*' })
end

return M
