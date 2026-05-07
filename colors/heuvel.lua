vim.o.background = 'dark'

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.g.colors_name = 'heuvel'

local c = {
  -- Base colors
  fg = '#cdcdcd',
  bg = '#141415',
  bg_light = '#323437',

  -- Syntax colors
  keyword = '#7285B0',
  type = '#66999B',
  string = '#66999B',
  comment = '#878787',

  -- Muted colors
  accent_muted = '#878787',

  -- Diagnostics
  error = '#9C6767',
  warn = '#FFC482',
  info = '#7285B0',
  hint = '#66999B',

  none = 'NONE',
}

local function set_hl(group, style)
  vim.api.nvim_set_hl(0, group, style)
end

-- UI
set_hl('Normal', { fg = c.fg, bg = c.none })
set_hl('NormalFloat', { fg = c.fg, bg = c.none })
set_hl('Cursor', { reverse = true })
set_hl('CursorLine', { bg = c.none })
set_hl('CursorLineNr', { fg = c.fg, bg = c.none })
set_hl('ColorColumn', { bg = c.bg_light })
set_hl('LineNr', { fg = c.comment })
set_hl('EndOfBuffer', { fg = c.comment })
set_hl('VertSplit', { fg = c.comment })
set_hl('Folded', { fg = c.comment, bg = c.bg_light })
set_hl('FoldColumn', { fg = c.comment })
set_hl('PMenu', { bg = c.none })
set_hl('PMenuSel', { bg = c.bg_light, bold = true })
set_hl('TabLine', { fg = c.comment, bg = c.none })
set_hl('TabLineFill', { bg = c.none })
set_hl('TabLineSel', { fg = c.fg, bg = c.none, bold = true })
set_hl('StatusLine', { fg = c.fg, bg = c.none })
set_hl('StatusLineNC', { fg = c.comment, bg = c.none })
set_hl('WildMenu', { fg = c.bg, bg = c.keyword })
set_hl('MatchParen', { fg = c.keyword, bold = true })
set_hl('Visual', { bg = c.bg_light })
set_hl('Search', { fg = c.bg, bg = c.type })
set_hl('IncSearch', { fg = c.bg, bg = c.type, bold = true })
set_hl('WinBar', { link = 'StatusLine' })
set_hl('WinBarNc', { link = 'StatusLine' })

-- Base Syntax
set_hl('Comment', { fg = c.comment, italic = true })
set_hl('String', { fg = c.string })
set_hl('Function', { fg = c.fg })
set_hl('Type', { fg = c.type })
set_hl('Keyword', { fg = c.keyword })
set_hl('Statement', { link = 'Keyword' })
set_hl('Conditional', { link = 'Keyword' })
set_hl('Repeat', { link = 'Keyword' })
set_hl('Operator', { fg = c.accent_muted })
set_hl('Identifier', { fg = c.fg })
set_hl('Number', { fg = c.fg })
set_hl('Boolean', { fg = c.keyword })
set_hl('Float', { fg = c.fg })
set_hl('Character', { fg = c.string })
set_hl('Constant', { fg = c.type })
set_hl('Special', { fg = c.fg })
set_hl('Delimiter', { fg = c.accent_muted })
set_hl('PreProc', { fg = c.keyword })
set_hl('Tag', { fg = c.keyword })

-- Messages
set_hl('Title', { fg = c.keyword, bold = true })
set_hl('Directory', { fg = c.type })
set_hl('ErrorMsg', { fg = c.error })
set_hl('WarningMsg', { fg = c.warn })
set_hl('Question', { fg = c.type })
set_hl('MoreMsg', { fg = c.type })
set_hl('NonText', { fg = c.comment })
set_hl('ModeMsg', { fg = c.type })

-- Diff
set_hl('DiffAdd', { bg = '#2d3830' })
set_hl('DiffChange', { bg = '#2d3038' })
set_hl('DiffDelete', { fg = c.error, bg = '#3a2d2d' })
set_hl('DiffText', { bg = '#3a3830' })

-- Diagnostics
set_hl('DiagnosticError', { fg = c.error })
set_hl('DiagnosticWarn', { fg = c.warn })
set_hl('DiagnosticInfo', { fg = c.info })
set_hl('DiagnosticHint', { fg = c.hint })
set_hl('DiagnosticOk', { fg = c.type })

-- Float / Borders
set_hl('FloatBorder', { fg = c.comment })
set_hl('FloatTitle', { fg = c.keyword })
set_hl('WinSeparator', { fg = c.comment })

-- Git signs
set_hl('GitSignsAdd', { fg = c.type })
set_hl('GitSignsChange', { fg = c.info })
set_hl('GitSignsDelete', { fg = c.error })

-- Specific
set_hl('Todo', { fg = c.bg, bg = c.keyword })
set_hl('Error', { fg = c.error, bold = true })

-- Core groups
set_hl('@comment', { link = 'Comment' })
set_hl('@string', { link = 'String' })
set_hl('@string.escape', { fg = c.keyword })
set_hl('@string.regex', { fg = c.string })
set_hl('@string.special', { fg = c.keyword })

set_hl('@character', { fg = c.string })
set_hl('@number', { fg = c.fg })
set_hl('@number.float', { fg = c.fg })
set_hl('@boolean', { fg = c.keyword })
set_hl('@constant', { fg = c.type })
set_hl('@constant.builtin', { fg = c.keyword })

-- Functions
set_hl('@function', { fg = c.fg })
set_hl('@function.call', { fg = c.fg })
set_hl('@function.method', { fg = c.fg })
set_hl('@function.method.call', { fg = c.fg })
set_hl('@function.builtin', { fg = c.type })
set_hl('@constructor', { fg = c.type })

-- Keywords
set_hl('@keyword', { fg = c.keyword })
set_hl('@keyword.function', { fg = c.keyword })
set_hl('@keyword.operator', { fg = c.accent_muted })
set_hl('@keyword.conditional', { fg = c.keyword })
set_hl('@keyword.repeat', { fg = c.keyword })
set_hl('@keyword.import', { fg = c.keyword })
set_hl('@keyword.exception', { fg = c.keyword })
set_hl('@keyword.coroutine', { fg = c.keyword })
set_hl('@keyword.return', { fg = c.keyword })
set_hl('@keyword.type', { fg = c.keyword })

-- Types
set_hl('@type', { fg = c.type })
set_hl('@type.builtin', { fg = c.type })
set_hl('@type.definition', { fg = c.type })
set_hl('@type.qualifier', { fg = c.keyword })

-- Variables
set_hl('@variable', { fg = c.fg })
set_hl('@variable.builtin', { fg = c.type })
set_hl('@variable.parameter', { fg = c.fg })
set_hl('@variable.member', { fg = c.fg })

-- Properties and attributes
set_hl('@property', { fg = c.fg })
set_hl('@attribute', { fg = c.accent_muted })
set_hl('@attribute.builtin', { fg = c.keyword })

-- Operators and punctuation
set_hl('@operator', { fg = c.accent_muted })
set_hl('@punctuation.bracket', { fg = c.accent_muted })
set_hl('@punctuation.delimiter', { fg = c.accent_muted })
set_hl('@punctuation.special', { fg = c.accent_muted })
set_hl('@symbol', { fg = c.accent_muted })

-- Modules and namespaces
set_hl('@module', { fg = c.fg })
set_hl('@module.builtin', { fg = c.type })
set_hl('@namespace', { fg = c.fg })
set_hl('@label', { fg = c.keyword })

-- Other
set_hl('@interface', { fg = c.type })
set_hl('@exception', { fg = c.error })
set_hl('@lsp.type.interface', { fg = c.type })
set_hl('@lsp.type.struct', { fg = c.type })

set_hl('@type.generic', { fg = c.type })
set_hl('@type.parameter', { fg = c.type })
set_hl('typescriptGenericType', { fg = c.type })
set_hl('typescriptTypeReference', { fg = c.type })
set_hl('typescriptTypeAnnotation', { fg = c.type })

set_hl('@tag', { fg = c.keyword })
set_hl('@tag.builtin', { fg = c.keyword })
set_hl('@tag.attribute', { fg = c.fg })
set_hl('@tag.delimiter', { fg = c.accent_muted })

set_hl('@constructor.tsx', { fg = c.type })
set_hl('@variable.component', { fg = c.type })

set_hl('htmlH1', { fg = c.fg, bold = false })
set_hl('htmlH2', { fg = c.fg, bold = false })
set_hl('htmlH3', { fg = c.fg, bold = false })
set_hl('htmlH4', { fg = c.fg, bold = false })
set_hl('htmlH5', { fg = c.fg, bold = false })
set_hl('htmlH6', { fg = c.fg, bold = false })
