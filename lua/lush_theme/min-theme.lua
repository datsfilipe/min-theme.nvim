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
	blueDark = hsl("#316bcd"),
	yellowDark = hsl("#cd9731"),
	redDark = hsl("#cd3131"),
	purpleDark = hsl("#800080"),
	comment = hsl("#6b737c"),
	symbol = hsl("#bbbbbb"),
	white = hsl("#ffffff"),
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
	blueDark = hsl("#316bcd"),
	yellowDark = hsl("#cd9731"),
	purpleDark = hsl("#800080"),
	symbol = hsl("#a1a1a1"),
	white = hsl("#ffffff"),
	terminalBrightBlack = hsl("#333333"),
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
		ColorColumn({ bg = shade(t.bg, 5).mix(t.blueLight, 5) }),
		Conceal({ fg = t.symbol }),
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
		IncSearch({ bg = t.comment.mix(t.blue, 5), fg = t.bg }),
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
		Character({ fg = t.symbol }),
		Number({ fg = t.white, gui = "bold" }),
		Boolean({ fg = t.blue }),
		Float({ Number }),

		Identifier({ fg = t.white }),
		Function({ fg = t.purple }),
		Method({ fg = t.purple }),
		Property({ fg = t.blue }),
		Field({ Property }),
		Parameter({ fg = t.fg }),
		Statement({ fg = t.red }),
		Conditional({ fg = t.red }),
		-- Repeat({}),
		-- Label({}),
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

		Special({ Character }),
		Attribute({ Character }),
		Punctuation({ fg = t.purple }),

		-- SpecialChar({}),
		Tag({ fg = t.blue }),
		-- Delimiter({}),
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

		sym("@text")({ Identifier }),
		sym("@text.literal")({ Property }),
		-- sym("@text.reference")({}),
		sym("@text.strong")({ Bold }),
		sym("@text.italic")({ Italic }),
		sym("@text.title")({ Keyword }),
		sym("@text.uri")({ fg = t.blue, sp = t.blue, gui = "underline" }),
		sym("@text.underline")({ Underlined }),
		sym("@symbol")({ Constant }),
		-- sym("@text.todo")({}),
		sym("@comment")({ Comment }),
		sym("@punctuation")({ fg = t.symbol }),
		sym("@punctuation.bracket")({ fg = t.symbol }),
		sym("@punctuation.delimiter")({ fg = t.symbol }),
		sym("@punctuation.special")({ fg = t.symbol }),
		sym("@constant")({ Constant }),
		sym("@constant.builtin")({ Keyword }),
		sym("@type.qualifier")({ Statement }),
		-- sym("@constant.macro")({}),
		-- sym("@define")({}),
		-- sym("@macro")({}),
		-- sym("@string")({}),
		sym("@string.escape")({ Character }),
		-- sym("@string.special")({}),
		-- sym("@character")({}),
		-- sym("@character.special")({}),
		-- sym("@number")({}),
		-- sym("@boolean")({}),
		-- sym("@float")({}),
		sym("@function")({ Function }),
		sym("@function.call")({ Function }),
		sym("@function.builtin")({ Function }),
		-- sym("@function.macro")({}),
		sym("@parameter")({ Parameter }),
		sym("@method")({ Function }),
		sym("@field")({ Property }),
		sym("@property")({ Property }),
		-- sym("@constructor")({}),
		-- sym("@conditional")({}),
		-- sym("@repeat")({}),
		sym("@label")({ Keyword }),
		sym("@operator")({ Operator }),
		-- sym("@keyword")({}),
		sym("@exception")({ Exception }),
		sym("@variable")({ fg = t.blue }),
		sym("@variable.builtin")({ Statement }),
		sym("@type")({ Type }),
		sym("@type.builtin")({ Keyword }),
		sym("@type.qualifier")({ Statement }),
		sym("@keyword")({ Keyword }),
		-- sym("@type.definition")({}),
		-- sym("@storageclass")({}),
		-- sym("@structure")({}),
		sym("@namespace")({ Type }),
		sym("@annotation")({ sym("@label") }),
		-- sym("@include")({}),
		-- sym("@preproc")({}),
		-- sym("@debug")({}),
		sym("@tag")({ Tag }),
		sym("@attribute")({ Attribute }),
		sym("@tag.attribute")({ fg = t.symbol }),
		sym("@error")({ Error }),
		sym("@warning")({ WarningMsg }),
		sym("@info")({ fg = t.blue }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
