local colors = {
  white = '#ffffff',
  black = '#1e1e1e',
}

if vim.o.background == 'light' then
  -- background colors
  colors.g = '#ffffff'
  colors.gDark = '#dddddd'
  colors.gDarker = '#f6f6f6'
  colors.gFloat = '#E0E0E0'
  colors.gOption = '#EDEDED'
  -- foreground colors
  colors.g = '#616161'
  colors.gAlt = '#212121'
  colors.gCommand = '#333333'
  colors.gInactive = '#9E9E9E'
  colors.gDisabled = '#D0D0D0'
  colors.gLineNr = '#a1a1a1'
  colors.gSelection = '#424242'
  colors.gSelectionInactive = '#757575'
  -- border colors
  colors.order = '#c2c3c5'
  colors.orderFocus = '#AAAAAA'
  colors.orderDarker = '#999999'
  -- ui colors
  colors.blue = '#6871ff'
  colors.red = '#d6656a'
  colors.purple = '#9966cc'
  colors.redDark = '#D32F2F'
  colors.orange = '#f29718'
  colors.blueLight = '#1976D2'
  colors.comment = '#848484'
  colors.orangeLight = '#dd8500'
  colors.green = '#22863a'
  colors.yellowDark = '#cd9731'
  colors.purpleDark = '#800080'
  colors.symbol = '#a1a1a1'
  colors.primary = '#000000'
  colors.terminalbrightblack = '#333333'
else
  -- background colors
  colors.bg = '#212121'
  colors.bgDark = '#1A1A1A'
  colors.bgDarker = '#292929'
  colors.bgFloat = '#383838'
  colors.bgOption = '#282828'
  -- foreground colors
  colors.fg = '#c1c1c1'
  colors.fgAlt = '#FAFAFA'
  colors.fgCommand = '#E0E0E0'
  colors.fgInactive = '#484848'
  colors.fgDisabled = '#848484'
  colors.fgLineNr = '#727272'
  colors.fgSelection = '#EAEAEA'
  colors.fgSelectionInactive = '#F5F5F5'
  -- border colors
  colors.border = '#2A2A2A'
  colors.borderFocus = '#444444'
  colors.borderDarker = '#363636'
  -- ui colors
  colors.red = '#FF7A84'
  colors.blue = '#79b8ff'
  colors.orange = '#FF9800'
  colors.purple = '#b392f0'
  colors.blueLight = '#9db1c5'
  colors.orangeLight = '#ffab70'
  colors.yellowDark = '#cd9731'
  colors.green = '#22863a'
  colors.redDark = '#cd3131'
  colors.purpleDark = '#800080'
  colors.comment = '#6b737c'
  colors.symbol = '#bbbbbb'
  colors.primary = '#ffffff'
  colors.terminalBrightBlack = '#5c5c5c'
end

return colors