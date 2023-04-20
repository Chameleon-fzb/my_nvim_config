local on_attach = function(client, bufnr)
   -- 禁用格式化功能，交给专门插件插件处理
--client.server_capabilities.document_formatting = false-- 0.7 and earlier
--client.server_capabilities.document_range_formatting = false
client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
   local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
   end
end
return on_attach
