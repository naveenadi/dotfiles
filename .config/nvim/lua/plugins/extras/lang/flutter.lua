return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "dart" })
    end,
  },

  -- flutter
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
      "RobertBrunhage/flutter-riverpod-snippets",
    },
    config = function()
      local flutterConfig = require("flutter-tools")

      flutterConfig.setup({
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
            -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
            -- this will show the currently selected project configuration
            project_config = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        lsp = {
          -- see the link below for details on each option:
          -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = { "./fvm/", vim.fn.expand("$Home/.pub-cache") },
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
          },
        },
      })
    end,
  },

  -- flutter riverpod dependencies
  {
    "RobertBrunhage/flutter-riverpod-snippets",
  },

  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin",
  },
}
