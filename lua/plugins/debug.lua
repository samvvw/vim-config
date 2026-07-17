return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      { "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim" } },
    },
    keys = {
      { "<leader>dr", function() require("dap").continue() end, desc = "Debug: continue / start" },
      { "<leader>ds", function() require("dap").terminate() end, desc = "Debug: terminate" },
      { "<leader>dq", function() require("dap").restart() end, desc = "Debug: restart" },
      { "<leader>dc", function() require("dap").run_to_cursor() end, desc = "Debug: run to cursor" },
      { "<leader>SO", function() require("dap").step_over() end, desc = "Debug: step over" },
      { "<leader>SI", function() require("dap").step_into() end, desc = "Debug: step into" },
      { "<leader>SQ", function() require("dap").step_out() end, desc = "Debug: step out" },
      { "<leader>do", function() require("dap").toggle_breakpoint() end, desc = "Debug: toggle breakpoint" },
      {
        "<leader>dO",
        function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        desc = "Debug: conditional breakpoint",
      },
      {
        "<leader>dF",
        function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
        desc = "Debug: log point",
      },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: toggle UI" },
      {
        "<leader>dp",
        function() require("dap.ui.widgets").hover() end,
        mode = { "n", "x" },
        desc = "Debug: evaluate under cursor",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
        handlers = {}, -- default handlers register the installed adapters
      })

      -- Open/close the UI automatically around a debug session
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- codelldb launch configuration, shared by compiled languages
      local codelldb = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.rust = codelldb
      dap.configurations.c = codelldb
      dap.configurations.cpp = codelldb
    end,
  },
}
