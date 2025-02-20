-- Github theme
---------------
vim.cmd([[colorscheme gruvbox]])

-- Treesitter
-------------
local treesitter_config = require("nvim-treesitter.configs")
local treesitter_install = require("nvim-treesitter.install")
treesitter_install.prefer_git = false
treesitter_config.setup({
    ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "asm", "cmake", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})

-- Cmp
-----
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end, },
    window = { },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },

})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP config
------------
local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
-- Lua
lspconfig.lua_ls.setup({
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath("config") and (vim.loop.fs_stat(path.."/.luarc.json") or vim.loop.fs_stat(path.."/.luarc.jsonc")) then
                return
            end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = { version = "LuaJIT", },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME },
            },
        })
    end,
    settings = { Lua = { }, },
    capabilities = capabilities,
})
-- CMake
lspconfig_configs.neocmake = {
    default_config = {
        cmd = { "neocmakelsp", "--stdio" },
        filetypes = { "cmake" },
        root_dir = function(fname) return lspconfig.util.find_git_ancestor(fname) end,
        single_file_support = true,
        init_options = {
            format = { enable = true },
            lint = { enable = true },
            scan_cmake_in_package = true,
        }
    },
    capabilities = capabilities,
}
lspconfig.neocmake.setup({ capabilities = capabilities, })
lspconfig.clangd.setup({ filetypes = { "c", "cpp", "h", "hpp", }, capabilities = capabilities, })
lspconfig.pyright.setup({ capabilities = capabilities, })
