" 设置gui字体
set guifont=DejavuSansMono\ Nerd\ Font\ Mono:h12

" 设置gui tab 和 popup 适用 tui 样式
set winaltkeys=no
if has('nvim')
    try
        call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
        call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    catch
    endtry
endif
