-- require('onedark').load()

vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['onedark_termcolors'] = 256
vim.g['airline_powerline_fonts'] = 1

function ChangeTheme(color)
   local theme = color or vim.o.background

   require("rose-pine").setup({
      before_highlight = function(group, highlight, palette)
         -- Disable all undercurls
         if highlight.undercurl then
            --       highlight.undercurl = false
         end
         --
         -- Change palette colour
         -- if highlight.fg == palette.pine then
         --     highlight.fg = palette.foam
         -- end
      end
   })

   if (theme == 'light') then
      vim.o.background = 'dark'
      vim.g['airline_theme'] = 'simple'
      -- vim.cmd([[colorscheme tokyonight]])
      vim.cmd([[colorscheme rose-pine-main]])
      --   require('onedark').setup {
      --      style = 'darker'
      --   }
      --   require('onedark').load()
   else
      vim.o.background = 'light'

      vim.cmd([[colorscheme rose-pine-dawn]])
      -- vim.cmd([[colorscheme tokyonight-day]])
      vim.g['airline_theme'] = 'solarized'
   end
end

ChangeTheme('light')
