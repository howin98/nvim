local vim = vim

vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

if vim.g.vscode then
  vsc = require('vscode-neovim')

  vim.keymap.set('n', '/', function() vsc.action('actions.find') end)
  vim.keymap.set('v', '/', function()
    vsc.call('actions.find')
    vsc.action('toggleFindInSelection')
  end)

  vim.keymap.set('n', 'gd', function() vsc.action('editor.action.revealDefinition') end)
  vim.keymap.set('n', 'gr', function() vsc.action('editor.action.goToReferences') end)
  vim.keymap.set('n', 'gR', function() vsc.action('references-view.findReferences') end)

  vim.keymap.set({ 'n', 'v' }, 'g:', function() vsc.action('inlineChat.start') end)
  vim.keymap.set({ 'n', 'v' }, 'g;e', function() vsc.action('github.copilot.interactiveEditor.explain') end)
  vim.keymap.set({ 'n', 'v' }, 'g;d', function() vsc.action('github.copilot.interactiveEditor.generateDocs') end)

  vim.keymap.set('n', 'gB', function() vsc.action('bookmarks.toggleLabeled') end)
  vim.keymap.set('n', 'gbb', function() vsc.action('bookmarks.toggle') end)
  vim.keymap.set('n', 'gbl', function() vsc.action('bookmarks.listFromAllFiles') end)
  vim.keymap.set('n', 'gbj', function() vsc.action('bookmarks.jumpToNext') end)
  vim.keymap.set('n', 'gbk', function() vsc.action('bookmarks.jumpToPrevious') end)

  vim.keymap.set('n', 'gF', function() vsc.action('editor.action.formatDocument') end)
  vim.keymap.set('n', 'gf', function() vsc.action('editor.action.formatChanges') end)
  vim.keymap.set('v', 'gf', function() vsc.action('editor.action.formatSelection') end)
  vim.keymap.set('n', 'g/', function() vsc.action('workbench.action.quickOpen') end)
  vim.keymap.set('n', 'gt', function() vsc.action('workbench.action.quickOpenLeastRecentlyUsedEditor') end)

  vim.api.nvim_set_keymap('n', 's', '', { noremap = true })
  vim.keymap.set('n', 'sh', function() vsc.action('workbench.action.splitEditorLeft') end)
  vim.keymap.set('n', 'sj', function() vsc.action('workbench.action.splitEditorDown') end)
  vim.keymap.set('n', 'sk', function() vsc.action('workbench.action.splitEditorUp') end)
  vim.keymap.set('n', 'sl', function() vsc.action('workbench.action.splitEditorRight') end)

  vim.keymap.set({ 'n', 'v', 'i' }, '<C-h>', function() vsc.action('workbench.action.focusLeftGroup') end)
  vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', function() vsc.action('workbench.action.focusBelowGroup') end)
  vim.keymap.set({ 'n', 'v', 'i' }, '<C-k>', function() vsc.action('workbench.action.focusAboveGroup') end)
  vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', function() vsc.action('workbench.action.focusRightGroup') end)
end
