lua << EOF
local coc_status_record = {}

function coc_notify(msg, level)
  local notify_opts = { title = "LSP Message", timeout = 500 }
  vim.notify(msg, level, notify_opts)
end

-- local coc_diag_record = {}

function coc_diag_notify(msg, level)
  local notify_opts = { title = "LSP Diagnostics", timeout = 500 }
  -- local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
  -- Disable replace
  -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
  -- if coc_diag_record ~= {} then
  --   notify_opts["replace"] = coc_diag_record.id
  -- end
  coc_diag_record = vim.notify(msg, level, notify_opts)
end

-- function reset_coc_diag_record(window)
--   coc_diag_record = {}
-- end

EOF

function! s:DiagnosticNotify() abort
  let l:info = get(b:, 'coc_diagnostic_info', {})
  if empty(l:info) | return '' | endif
  let l:msgs = []
  let l:level = 'info'
   if get(l:info, 'warning', 0)
    let l:level = 'warn'
  endif
  if get(l:info, 'error', 0)
    let l:level = 'error'
  endif
 
  if get(l:info, 'error', 0)
    call add(l:msgs, ' Errors: ' . l:info['error'])
  endif
  if get(l:info, 'warning', 0)
    call add(l:msgs, ' Warnings: ' . l:info['warning'])
  endif
  if get(l:info, 'information', 0)
    call add(l:msgs, ' Infos: ' . l:info['information'])
  endif
  if get(l:info, 'hint', 0)
    call add(l:msgs, ' Hints: ' . l:info['hint'])
  endif
  let l:msg = join(l:msgs, "\n")
  if empty(l:msg) | let l:msg = ' All OK' | endif
  call v:lua.coc_diag_notify(l:msg, l:level)
endfunction

function! s:InitCoc() abort
  " Override the default notification
  source ~/.config/nvim/viml/coc/notify-overload.vim
endfunction

" notifications
augroup CocGroup
  autocmd!
  autocmd User CocNvimInit call s:InitCoc()
  autocmd User CocDiagnosticChange call s:DiagnosticNotify()
augroup END
