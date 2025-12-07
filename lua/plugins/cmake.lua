return {
  'Civitasv/cmake-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', },
  config = function()
    require('cmake-tools').setup(
      {
        cmake_kits_path = '~/.local/share/CMakeTools/cmake-tools-kits.json',
        cmake_dap_configuration = {
          name = 'cpp',
          type = '/usr/bin/lldb-dap',
          request = 'launch',
          stopOnEntry = false,
          runInTerminal = true,
          console = 'integratedTerminal',
        },
      }
    )
    vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>')
    vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>')
    vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>')
    vim.keymap.set('n', '<leader>ct', ':CMakeTest<CR>')
  end
}
