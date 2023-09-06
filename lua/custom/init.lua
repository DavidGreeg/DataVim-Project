vim.cmd([[
	autocmd FileType python setlocal ts=4 sts=0 sw=0 list listchars=tab:▶·,trail:· noexpandtab
	" autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>4;2m]") | endif
	" autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>4;0m]") | endif
	]])
-- UIEnter & UILeave hopefully will let me do mappings with both CTRL + SHIFT
