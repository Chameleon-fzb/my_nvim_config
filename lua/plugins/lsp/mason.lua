return {
    "williamboman/mason.nvim",
    lazy=true,
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonUpdate",
        "MasonUpdateAll", 
      },
    opts={
        ui = {
            icons = {
                package_installed = "🟢",
                package_pending = "⬇",
                package_uninstalled = "📛"
            },

    --          keymaps = {
    --             -- 用于扩展包的键映射
    --             toggle_package_expand = "<C-1>",
    --             -- 安装在当前光标位置下的包
    --             install_package = "i",
    --             -- 重新安装当前光标位置下的包
    --             update_package = "u",
    --             -- 检查当前光标位置下包的新版本
    --             check_package_version = "c",
    --             -- 检查全部已安装的包
    --             update_all_packages = "U",
    --             -- 检查哪些已安装的包是否已过时
    --             check_outdated_packages = "C",
    --             -- 卸载包
    --             uninstall_package = "X",
    --             -- 取消包下载
    --             cancel_installation = "<C-c>",
    --             -- 应用语言过滤器
    --             apply_language_filter = "<C-f>",
    --         },
        }
    }
}