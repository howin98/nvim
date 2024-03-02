local vim = vim

if vim.g.vscode then
  local vsc = require('vscode-neovim')

  vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'
  vim.o.ignorecase = true
  vim.o.smartcase = true

  local function set_shortcut(mode, shortcut, actions)
    local mode_set = {}
    for i = 1, #mode do
      table.insert(mode_set, mode:sub(i, i))
    end

    vim.keymap.set(mode_set, shortcut,
      function()
        for i, val in ipairs(actions) do
          if i == #actions then vsc.action(val) else vsc.call(val) end
        end
      end)
  end

  set_shortcut('n', '/', { 'actions.find' })
  set_shortcut('v', '/', { 'actions.find', 'toggleFindInSelection' })
  set_shortcut('nv', 'gd', { 'editor.action.revealDefinition' })
  set_shortcut('nv', 'gr', { 'editor.action.goToReferences' })
  set_shortcut('nv', 'gR', { 'references-view.findReferences' })
  set_shortcut('nv', 'g:', { 'inlineChat.start' })
  set_shortcut('nv', 'gb', { 'bookmarks.toggle' })
  set_shortcut('nv', 'gB', { 'bookmarks.listFromAllFiles' })
  set_shortcut('nv', 'ge', { 'workbench.action.showAllEditors' })
  set_shortcut('nv', 'gF', { 'editor.action.formatDocument' })
  set_shortcut('n', 'gf', { 'editor.action.formatChanges' })
  set_shortcut('v', 'gf', { 'editor.action.formatSelection' })
  set_shortcut('nv', 'sh', { 'workbench.action.splitEditorLeft', 'workbench.action.quickOpen' })
  set_shortcut('nv', 'sj', { 'workbench.action.splitEditorDown', 'workbench.action.quickOpen' })
  set_shortcut('nv', 'sk', { 'workbench.action.splitEditorUp', 'workbench.action.quickOpen' })
  set_shortcut('nv', 'sl', { 'workbench.action.splitEditorRight', 'workbench.action.quickOpen' })
  set_shortcut('nvi', '<C-h>', { 'workbench.action.focusLeftGroup' })
  set_shortcut('nvi', '<C-j>', { 'workbench.action.focusBelowGroup' })
  set_shortcut('nvi', '<C-k>', { 'workbench.action.focusAboveGroup' })
  set_shortcut('nvi', '<C-l>', { 'workbench.action.focusRightGroup' })
  vim.api.nvim_set_keymap('n', 's', '', { noremap = true })
  vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })
  vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })
end
