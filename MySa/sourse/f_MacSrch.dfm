object MacSrchForm: TMacSrchForm
  Left = 0
  Top = 0
  Caption = 'MacSrchForm'
  ClientHeight = 547
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SprLbl: TLabel
    Left = 120
    Top = 11
    Width = 4
    Height = 13
    Caption = '-'
  end
  object uvlanLbl: TLabel
    Left = 167
    Top = 11
    Width = 54
    Height = 13
    Caption = 'User VLAN:'
  end
  object MacLbl: TLabel
    Left = 8
    Top = 38
    Width = 23
    Height = 13
    Caption = 'Mac:'
  end
  object DotLbl: TLabel
    Left = 83
    Top = 11
    Width = 4
    Height = 13
    Caption = '.'
  end
  object MacIpSt: TEdit
    Left = 87
    Top = 8
    Width = 27
    Height = 21
    TabOrder = 0
    Text = '2'
  end
  object MacIpEnd: TEdit
    Left = 129
    Top = 8
    Width = 28
    Height = 21
    TabOrder = 1
    Text = '125'
  end
  object MacEd: TEdit
    Left = 32
    Top = 35
    Width = 113
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = '00-00-00-00-00-00'
  end
  object MacSRchBtn: TButton
    Left = 152
    Top = 35
    Width = 74
    Height = 22
    Caption = 'Search'
    TabOrder = 3
    OnClick = MacSRchBtnClick
  end
  object MacIPSG: TAdvStringGrid
    Left = 0
    Top = 88
    Width = 262
    Height = 459
    Cursor = crDefault
    Align = alBottom
    ColCount = 3
    DrawingStyle = gdsClassic
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedColWidth = 42
    FixedRowHeight = 22
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    ShowDesignHelper = False
    Version = '5.8.0.5'
    ExplicitLeft = 8
    ExplicitTop = 80
    ExplicitWidth = 246
    ColWidths = (
      42
      112
      37)
  end
  object vlEd: TEdit
    Left = 222
    Top = 8
    Width = 32
    Height = 21
    TabOrder = 5
    Text = '120'
  end
  object MacIpEd: TEdit
    Left = 8
    Top = 8
    Width = 49
    Height = 20
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
    Text = '192.168.'
  end
  object MacSubNet: TEdit
    Left = 54
    Top = 8
    Width = 27
    Height = 21
    TabOrder = 7
    Text = '120'
  end
  object Edit1: TEdit
    Left = 8
    Top = 62
    Width = 246
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = '00-00-00-00-00-00'
  end
  object png: TIdIcmpClient
    ReceiveTimeout = 100
    Protocol = 1
    ProtocolIPv6 = 0
    IPVersion = Id_IPv4
    PacketSize = 1024
    Left = 304
  end
end
