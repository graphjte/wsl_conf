local ok, gps = pcall(require, 'nvim-gps')
if not ok then
  print("gps not found")
  return
end

local ok, lualine = pcall(require, 'lualine')
if not ok then
  print("lualine not found")
  return
end

gps.setup()

lualine.setup({
	sections = {
			lualine_c = {
                'filename', 
				{gps.get_location, cond = gps.is_available },
			}
	}
})
