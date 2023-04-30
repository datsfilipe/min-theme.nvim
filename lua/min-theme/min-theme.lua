local lush = require("lush")
local hsl = lush.hsl

local dark = {
	-- background colors
	bg = hsl("#212121"),
	bgDark = hsl("#1A1A1A"),
	bgDarker = hsl("#292929"),
	bgFloat = hsl("#383838"),
	bgOption = hsl("#282828"),
	-- foreground colors
	fg = hsl("#c1c1c1"),
	fgAlt = hsl("#FAFAFA"),
	fgCommand = hsl("#E0E0E0"),
	fgInactive = hsl("#484848"),
	fgDisabled = hsl("#848484"),
	fgLineNr = hsl("#727272"),
	fgSelection = hsl("#EAEAEA"),
	fgSelectionInactive = hsl("#F5F5F5"),
	-- border colors
	border = hsl("#2A2A2A"),
	borderFocus = hsl("#444444"),
	borderDarker = hsl("#363636"),
	-- ui colors
	red = hsl("#FF7A84"),
	blue = hsl("#79b8ff"),
	orange = hsl("#FF9800"),
	purple = hsl("#b392f0"),
	blueLight = hsl("#9db1c5"),
	orangeLight = hsl("#ffab70"),
	yellowDark = hsl("#cd9731"),
	green = hsl("#22863a"),
	redDark = hsl("#cd3131"),
	purpleDark = hsl("#800080"),
	comment = hsl("#6b737c"),
	symbol = hsl("#bbbbbb"),
	primary = hsl("#ffffff"),
	terminalBrightBlack = hsl("#5c5c5c"),
}

local light = {
	-- background colors
	bg = hsl("#ffffff"),
	bgDark = hsl("#dddddd"),
	bgDarker = hsl("#f6f6f6"),
	bgFloat = hsl("#E0E0E0"),
	bgOption = hsl("#EDEDED"),
	-- foreground colors
	fg = hsl("#616161"),
	fgAlt = hsl("#212121"),
	fgCommand = hsl("#333333"),
	fgInactive = hsl("#9E9E9E"),
	fgDisabled = hsl("#D0D0D0"),
	fgLineNr = hsl("#a1a1a1"),
	fgSelection = hsl("#424242"),
	fgSelectionInactive = hsl("#757575"),
	-- border colors
	border = hsl("#c2c3c5"),
	borderFocus = hsl("#AAAAAA"),
	borderDarker = hsl("#999999"),
	-- ui colors
	blue = hsl("#6871ff"),
	red = hsl("#d6656a"),
	purple = hsl("#9966cc"),
	redDark = hsl("#D32F2F"),
	orange = hsl("#f29718"),
	blueLight = hsl("#1976D2"),
	comment = hsl("#848484"),
	orangeLight = hsl("#dd8500"),
	green = hsl("#22863a"),
	yellowDark = hsl("#cd9731"),
	purpleDark = hsl("#800080"),
	symbol = hsl("#a1a1a1"),
	primary = hsl("#000000"),
	terminalbrightblack = hsl("#333333"),
}

local t = dark
print(t)

if vim.o.background == "light" then
	t = light
end

local function shade(color, value)
	if vim.o.background == "light" then
		return color.darken(value)
	else
		return color.lighten(value)
	end
end

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		Normal({ fg = t.fg, bg = t.bg }),
		LineNr({ fg = t.fgLineNr }),
		ColorColumn({ bg = shade(t.bg, 5).mix(t.blueLight, 30) }),
		Conceal({}),
		Cursor({ fg = t.bg, bg = t.fg }),
		lCursor({ Cursor }),
		CursorIM({ Cursor }),
		CursorLine({ bg = t.bgDarker }),
		CursorColumn({ CursorLine }),
		Directory({ fg = t.blue }),
		DiffAdd({ bg = t.bg }),
		DiffChange({ bg = t.bg }),
		DiffDelete({ bg = t.bg }),
		DiffText({ bg = t.bg }),
		EndOfBuffer({ fg = t.purple }),
		TermCursor({ Cursor }),
		TermCursorNC({ Cursor }),
		ErrorMsg({ fg = t.red }),
		VertSplit({ fg = t.border, bg = t.bg }),
		Winseparator({ VertSplit }),
		SignColumn({ Normal }),
		Folded({ fg = t.fg, bg = t.bgDarker }),
		FoldColumn({ SignColumn }),
		IncSearch({ bg = t.comment.mix(t.blue, 30), fg = t.bg }),
		Substitute({ IncSearch }),
		CursorLineNr({ fg = t.comment }),
		MatchParen({ fg = t.red, bg = t.bg }),
		ModeMsg({ Normal }),
		MsgArea({ Normal }),
		-- MsgSeparator({}),
		MoreMsg({ fg = t.blue }),
		NonText({ fg = shade(t.bg, 30) }),
		NormalFloat({ bg = t.bgFloat }),
		NormalNC({ Normal }),
		Pmenu({ NormalFloat }),
		PmenuSel({ bg = t.bgOption }),
		PmenuSbar({ bg = shade(t.bg, 5).mix(t.blue, 30) }),
		PmenuThumb({ bg = shade(t.bg, 20) }),
		Question({ fg = t.blue }),
		QuickFixLine({ fg = t.blue }),
		SpecialKey({ fg = t.symbol }),
		StatusLine({ fg = t.fg, bg = t.bg, gui = "" }),
		StatusLineNC({ fg = t.fgInactive, bg = t.bgDark }),
		TabLine({ bg = t.bgDark, fg = t.fgInactive }),
		TabLineFill({ TabLine }),
		TabLineSel({ bg = t.bg, fg = t.fgAlt }),
		Search({ bg = shade(t.bg, 5).mix(t.orangeLight, 30) }),
		SpellBad({ gui = "undercurl", sp = t.red }),
		SpellCap({ gui = "undercurl", sp = t.blue }),
		SpellLocal({ gui = "undercurl", sp = t.purple }),
		SpellRare({ gui = "undercurl", sp = t.orange }),
		Title({ fg = t.blue }),
		Visual({ bg = shade(t.bg, 5).mix(t.blue, 30) }),
		VisualNOS({ Visual }),
		WarningMsg({ fg = t.orange }),
		Whitespace({ fg = t.symbol }),
		WildMenu({ bg = t.bgOption }),
		Comment({ fg = t.comment }),

		Constant({ fg = t.red }),
		String({ fg = t.orangeLight }),
		Character({ fg = t.orangeLight }),
		Number({ fg = t.primary, gui = "bold" }),
		Boolean({ fg = t.blue }),
		Float({ Number }),

		Identifier({ fg = t.fg }),
		Function({ fg = t.purple }),
		Method({ fg = t.purple }),
		Property({ fg = t.blue }),
		Field({ Property }),
		Parameter({ fg = t.fg }),
		Statement({ fg = t.red }),
		Conditional({ fg = t.red }),
		-- Repeat({}),
		Label({ fg = t.blue }),
		Operator({ fg = t.red }),
		Keyword({ Statement }),
		Exception({ fg = t.red }),

		PreProc({ Keyword }),
		-- Include({}),
		Define({ fg = t.purple }),
		Macro({ Define }),
		PreCondit({ fg = t.red }),

		Type({ fg = t.purple }),
		Struct({ Type }),
		Class({ Type }),

		-- StorageClass({}),
		-- Structure({}),
		-- Typedef({}),

		Attribute({ Character }),
		Punctuation({ fg = t.symbol }),
		Special({ fg = t.symbol }),

		SpecialChar({ fg = t.red }),
		Tag({ fg = t.orangeLight }),
		Delimiter({ fg = t.symbol }),
		-- SpecialComment({}),
		Debug({ fg = t.purpleDark }),

		Underlined({ gui = "underline" }),
		Bold({ gui = "bold" }),
		Italic({ gui = "italic" }),
		Ignore({ fg = t.bg }),
		Error({ ErrorMsg }),
		Todo({ fg = t.orange, gui = "bold" }),

		-- LspReferenceText({}),
		-- LspReferenceRead({}),
		-- LspReferenceWrite({}),
		-- LspCodeLens({}),
		-- LspCodeLensSeparator({}),
		-- LspSignatureActiveParameter({}),

		DiagnosticError({ Error }),
		DiagnosticWarn({ WarningMsg }),
		DiagnosticInfo({ fg = t.blue }),
		DiagnosticHint({ fg = t.yellowDark }),
		DiagnosticVirtualTextError({ DiagnosticError }),
		DiagnosticVirtualTextWarn({ DiagnosticWarn }),
		DiagnosticVirtualTextInfo({ DiagnosticInfo }),
		DiagnosticVirtualTextHint({ DiagnosticHint }),
		DiagnosticUnderlineError({ gui = "undercurl", DiagnosticError }),
		DiagnosticUnderlineWarn({ gui = "undercurl", DiagnosticWarn }),
		DiagnosticUnderlineInfo({ gui = "undercurl", DiagnosticInfo }),
		DiagnosticUnderlineHint({ gui = "undercurl", DiagnosticHint }),
		-- DiagnosticFloatingError({}),
		-- DiagnosticFloatingWarn({}),
		-- DiagnosticFloatingInfo({}),
		-- DiagnosticFloatingHint({}),
		-- DiagnosticSignError({}),
		-- DiagnosticSignWarn({}),
		-- DiagnosticSignInfo({}),
		-- DiagnosticSignHint({}),

		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym("@text")({ fg = t.fg }),
		sym("@text.literal")({ Property }),
		-- sym("@text.reference")({}),
		sym("@text.strong")({ Bold }),
		sym("@text.italic")({ Italic }),
		sym("@text.title")({ Keyword }),
		sym("@text.uri")({ fg = t.blue, sp = t.blue, gui = "underline" }),
		sym("@text.underline")({ Underlined }),
		sym("@symbol")({ fg = t.symbol }),
		sym("@text.todo")({ Todo }),
		sym("@comment")({ Comment }),
		sym("@punctuation")({ Punctuation }),
		sym("@punctuation.bracket")({ fg = t.yellowDark }),
		sym("@punctuation.delimiter")({ Delimiter }),

		sym("@text.diff.add")({ fg = t.green }),
		sym("@text.diff.delete")({ fg = t.redDark }),

		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ Keyword }),
		sym("@type.qualifier")({ Statement }),
		-- sym("@constant.macro")({}),
		-- sym("@define")({}),
		-- sym("@macro")({}),
		sym("@string")({ String }),
		sym("@string.escape")({ fg = shade(t.orangeLight, 45) }),
		sym("@string.special")({ fg = shade(t.blue, 45) }),
		-- sym("@character")({}),
		-- sym("@character.special")({}),
		sym("@number")({ Number }),
		sym("@boolean")({ Boolean }),
		-- sym("@float")({}),
		sym("@function")({ Function }),
		sym("@function.call")({ Function }),
		sym("@function.builtin")({ Function }),
		-- sym("@function.macro")({}),
		sym("@parameter")({ Parameter }),
		sym("@method")({ Function }),
		sym("@field")({ Property }),
		sym("@property")({ Property }),
		sym("@constructor")({ fg = t.blue }),
		-- sym("@conditional")({}),
		-- sym("@repeat")({}),
		sym("@label")({ Label }),
		sym("@operator")({ Operator }),
		sym("@exception")({ Exception }),
		sym("@variable")({ fg = t.fg }),
		sym("@variable.builtin")({ fg = t.fg }),
		sym("@type")({ Type }),
		sym("@type.definition")({ fg = t.fg }),
		sym("@type.builtin")({ fg = t.blue }),
		sym("@type.qualifier")({ fg = t.blue }),
		sym("@keyword")({ Keyword }),
		-- sym("@storageclass")({}),
		-- sym("@structure")({}),
		sym("@namespace")({ Type }),
		sym("@annotation")({ sym("@label") }),
		-- sym("@include")({}),
		-- sym("@preproc")({}),
		sym("@debug")({ fg = t.purpleDark }),
		sym("@tag")({ Tag }),
		sym("@tag.delimiter")({ fg = t.symbol }),
		sym("@tag.attribute")({ fg = t.purple }),
		sym("@attribute")({ Attribute }),
		sym("@error")({ Error }),
		sym("@warning")({ WarningMsg }),
		sym("@info")({ fg = t.blue }),

		-- Specific languages
		-- overrides
		sym("@label.json")({ fg = t.property }), -- For json
		sym("@label.help")({ sym("@text.uri") }), -- For help files
		sym("@text.uri.html")({ gui = "underline" }), -- For html

		-- semantic highlighting
		sym("@lsp.type.namespace")({ sym("@namespace") }),
		sym("@lsp.type.type")({ sym("@type") }),
		sym("@lsp.type.class")({ sym("@type") }),
		sym("@lsp.type.enum")({ sym("@type") }),
		sym("@lsp.type.interface")({ sym("@type") }),
		sym("@lsp.type.struct")({ sym("@type") }),
		sym("@lsp.type.parameter")({ sym("@parameter") }),
		sym("@lsp.type.property")({ sym("@text") }),
		sym("@lsp.type.enumMember")({ sym("@constant") }),
		sym("@lsp.type.function")({ sym("@function") }),
		sym("@lsp.type.method")({ sym("@method") }),
		sym("@lsp.type.macro")({ sym("@label") }),
		sym("@lsp.type.decorator")({ sym("@label") }),
		sym("@lsp.typemod.function.declaration")({ sym("@function") }),
		sym("@lsp.typemod.function.readonly")({ sym("@function") }),
	}
end)

-- highlight ":" character in js/ts files to be same as Constant

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
