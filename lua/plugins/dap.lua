return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text'
  },
  config = function()
    local dap = require('dap')
    local ui = require('dapui')

    ui.setup()
    require('nvim-dap-virtual-text').setup()

    vim.fn.sign_define('DapBreakpoint', { text = '⬤', texthl = 'DapBreakpointColor', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '⬤', texthl = '', linehl = 'DapStoppedColor', numhl = '' })

    vim.api.nvim_set_hl(0, 'DapBreakpointColor', { fg = '#fa4848' })
    vim.api.nvim_set_hl(0, 'DapStoppedColor', { bg = '#211c13' })

    dap.listeners.before.attach.dapui_config = ui.open
    dap.listeners.before.launch.dapui_config = ui.open
    dap.listeners.before.event_terminated.dapui_config = ui.close
    dap.listeners.before.event_exited.dapui_config = ui.close

    vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint)

    vim.keymap.set('n', '<F1>', dap.continue)
    vim.keymap.set('n', '<F2>', dap.step_into)
    vim.keymap.set('n', '<F3>', dap.step_over)
    vim.keymap.set('n', '<F4>', dap.step_out)
    vim.keymap.set('n', '<F5>', dap.step_back)

    dap.adapters.lldb = {
      type = 'executable',
      command = 'lldb-dap',
      name = 'lldb'
    }
  end
}
