-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Function to set a colorscheme
function SetColorscheme(name)
  local colorscheme_path = "~/.config/nvim/colors/" .. name .. ".vim"
  -- Check if the colorscheme file exists
  if vim.fn.filereadable(vim.fn.expand(colorscheme_path)) == 1 then
    vim.cmd("colorscheme " .. name)
  else
    print("Colorscheme not found: " .. name)
  end
end

-- Call the function with your custom colorscheme
SetColorscheme("darcula")
