vim.cmd([[
	autocmd FileType python setlocal ts=4 sts=0 sw=0 list listchars=tab:▶·,trail:· noexpandtab
	" autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>4;2m]") | endif
	" autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>4;0m]") | endif
	]])
-- UIEnter & UILeave hopefully will let me do mappings with both CTRL + SHIFT

-- local nvim_web_devicons_path = vim.fn.stdpath "data" .. "/lazy/nvim-web-devicons"
-- local devicons_path = package.searchpath("/lua/nvim-web-devicons.lua", nvim_web_devicons_path)

--if devicons_path then
--	require(devicons_path:gsub("%.lua$","")).set_icon{
--		R = {
--			icon = "󰟔",
--			color = "#358a5b",
--			cterm_color = "29",
--			name = "R",
--		}
--	}
--end

-- local devicons_path = vim.fn.stdpath "data" .. "/lazy/nvim-web-devicons"
-- local devicons = dofile(devicons_path .. "/lua/nvim-web-devicons.lua")
--
-- devicons.set_icon{
-- 	R = {
-- 		icon = "󰟔",
-- 		color = "#358a5b",
-- 		cterm_color = "29",
-- 		name = "R",
-- 	}
-- 	-- Rmd = {
-- 	-- 	icon = "",
-- 	-- 	color = "#519aba",
-- 	-- 	cterm_color = "74",
-- 	-- 	name = "Rmd",
-- 	-- }
-- }

-- devicons.icons_by_file_extension["r"]



