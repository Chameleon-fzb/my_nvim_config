vim.cmd([[
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
autocmd InsertLeave * :silent !fcitx-remote -c
autocmd BufCreate *  :silent !fcitx-remote -c
autocmd BufEnter *  :silent !fcitx-remote -c
autocmd BufLeave *  :silent !fcitx-remote -c
]])
