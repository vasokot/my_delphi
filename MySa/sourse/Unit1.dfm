object MainForm: TMainForm
  Left = 748
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Multifunctional SNMP Agent'
  ClientHeight = 599
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SysGB: TGroupBox
    Left = 0
    Top = 44
    Width = 841
    Height = 170
    Caption = 'System Info'
    TabOrder = 0
    Visible = False
    object Label1: TLabel
      Left = 672
      Top = 15
      Width = 39
      Height = 13
      Caption = '10 '#1084#1073#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 672
      Top = 29
      Width = 45
      Height = 13
      Caption = '100 '#1084#1073#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 672
      Top = 44
      Width = 51
      Height = 13
      Caption = '1000 '#1084#1073#1080#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PortSL: TAdvStringGrid
      Left = 7
      Top = 65
      Width = 376
      Height = 66
      Cursor = crDefault
      ColCount = 12
      DefaultColWidth = 31
      DefaultRowHeight = 31
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      ParentShowHint = False
      PopupMenu = PSLPopUp
      ScrollBars = ssNone
      ShowHint = True
      TabOrder = 0
      OnClickCell = PortSLClickCell
      OnRightClickCell = PortSLRightClickCell
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
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 31
      FixedRowHeight = 31
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
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowSelection = False
      ShowDesignHelper = False
      VAlignment = vtaCenter
      Version = '5.8.0.5'
    end
    object DTEdit: TEdit
      Left = 406
      Top = 15
      Width = 252
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      Text = 'Device Type'
    end
    object SNEdit: TEdit
      Left = 129
      Top = 15
      Width = 145
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      Text = 'Device Name'
    end
    object RFbtn: TButton
      Left = 8
      Top = 15
      Width = 110
      Height = 20
      Caption = 'Refresh System Info'
      TabOrder = 3
      OnClick = RFbtnClick
    end
    object Edit4: TEdit
      Left = 8
      Top = 137
      Width = 97
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      Text = 'NTP Server'
    end
    object NPEdit: TEdit
      Left = 115
      Top = 137
      Width = 95
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
      Text = 'primary'
      OnDblClick = NPEditDblClick
      OnExit = NPEditExit
    end
    object Edit7: TEdit
      Left = 418
      Top = 137
      Width = 97
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
      Text = 'DHCP Relay Server'
    end
    object DPEdit: TEdit
      Left = 628
      Top = 137
      Width = 95
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
      Text = 'IP'
      OnDblClick = DPEditDblClick
      OnExit = DPEditExit
    end
    object NSEdit: TEdit
      Left = 218
      Top = 137
      Width = 95
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
      Text = 'secondary'
      OnDblClick = NSEditDblClick
      OnExit = NSEditExit
    end
    object NTPSet: TButton
      Left = 320
      Top = 137
      Width = 57
      Height = 20
      Caption = 'Set'
      TabOrder = 9
      OnClick = NTPSetClick
    end
    object DSEdit: TEdit
      Left = 525
      Top = 137
      Width = 95
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
      Text = 'Status'
      OnDblClick = DPEditDblClick
      OnExit = DPEditExit
    end
    object PortClBtn: TButton
      Left = 8
      Top = 38
      Width = 110
      Height = 20
      Caption = 'Clear System Info'
      TabOrder = 11
      OnClick = PortClBtnClick
    end
    object SerNEdit: TEdit
      Left = 283
      Top = 15
      Width = 115
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 12
      Text = 'Serial Number'
    end
    object MACEd: TEdit
      Left = 406
      Top = 41
      Width = 252
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
      Text = 'Mac address'
    end
    object FWEdit: TEdit
      Left = 129
      Top = 41
      Width = 145
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 14
      Text = 'firmware'
    end
    object HWEdit: TEdit
      Left = 283
      Top = 42
      Width = 115
      Height = 20
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 15
      Text = 'hardware'
    end
    object PortSLMag: TAdvStringGrid
      Left = 763
      Top = 65
      Width = 66
      Height = 66
      Cursor = crDefault
      ColCount = 2
      DefaultColWidth = 31
      DefaultRowHeight = 31
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      ParentShowHint = False
      ScrollBars = ssNone
      ShowHint = True
      TabOrder = 16
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
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 31
      FixedRowHeight = 31
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
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowSelection = False
      ShowDesignHelper = False
      VAlignment = vtaCenter
      Version = '5.8.0.5'
    end
    object PortSL1: TAdvStringGrid
      Left = 385
      Top = 65
      Width = 376
      Height = 66
      Cursor = crDefault
      ColCount = 12
      DefaultColWidth = 31
      DefaultRowHeight = 31
      DrawingStyle = gdsClassic
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      ParentShowHint = False
      PopupMenu = PSLPopUp
      ScrollBars = ssNone
      ShowHint = True
      TabOrder = 17
      OnClickCell = PortSLClickCell
      OnRightClickCell = PortSLRightClickCell
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
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
      FilterDropDown.Font.Style = []
      FilterDropDownClear = '(All)'
      FixedColWidth = 31
      FixedRowHeight = 31
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
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      ShowSelection = False
      ShowDesignHelper = False
      VAlignment = vtaCenter
      Version = '5.8.0.5'
    end
  end
  object MainPanel: TPanel
    Left = -3
    Top = 1
    Width = 844
    Height = 45
    TabOrder = 1
    Visible = False
    object IPEdit: TEdit
      Left = 12
      Top = 5
      Width = 114
      Height = 21
      TabOrder = 0
      Text = '192.168.137.2'
      OnKeyPress = IPEditKeyPress
    end
    object Button6: TButton
      Left = 131
      Top = 5
      Width = 25
      Height = 20
      Caption = '<<'
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 177
      Top = 5
      Width = 104
      Height = 20
      Caption = 'Save Configuration'
      TabOrder = 2
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 289
      Top = 5
      Width = 75
      Height = 20
      Caption = 'Soft Reboot'
      TabOrder = 3
      OnClick = Button8Click
    end
    object GetImpBtn: TButton
      Left = 456
      Top = 5
      Width = 127
      Height = 20
      Caption = 'Get IMP - DHCP Tables'
      TabOrder = 4
      OnClick = GetImpBtnClick
    end
    object ClearBtn: TButton
      Left = 594
      Top = 5
      Width = 93
      Height = 20
      Caption = 'Clear Tables'
      TabOrder = 5
      OnClick = ClearBtnClick
    end
    object Button3: TButton
      Left = 370
      Top = 5
      Width = 80
      Height = 20
      Caption = 'Force Reboot'
      TabOrder = 6
      OnClick = Button3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 216
    Width = 841
    Height = 377
    ActivePage = TabSheet5
    TabOrder = 2
    Visible = False
    object TabSheet1: TTabSheet
      Caption = 'Mac Address Table'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object MacGB: TGroupBox
        Left = 3
        Top = 3
        Width = 827
        Height = 343
        Caption = 'MAC Address Table'
        TabOrder = 0
        Visible = False
        object GetBtn: TButton
          Left = 8
          Top = 16
          Width = 74
          Height = 20
          Caption = 'Get Table'
          TabOrder = 0
          OnClick = GetBtnClick
        end
        object ClearMacBtn: TButton
          Left = 90
          Top = 16
          Width = 69
          Height = 20
          Caption = 'Clear Table'
          TabOrder = 1
          OnClick = ClearMacBtnClick
        end
        object MacEdit: TEdit
          Left = 177
          Top = 16
          Width = 104
          Height = 21
          TabOrder = 2
          Text = '00:00:00:00:00:00'
        end
        object FindBtn: TButton
          Left = 323
          Top = 15
          Width = 58
          Height = 20
          Caption = 'Find'
          TabOrder = 3
          OnClick = FindBtnClick
        end
        object Button5: TButton
          Left = 286
          Top = 16
          Width = 25
          Height = 20
          Caption = '<<'
          TabOrder = 4
          OnClick = Button5Click
        end
        object MACSG: TAdvStringGrid
          Left = 3
          Top = 43
          Width = 450
          Height = 297
          Cursor = crDefault
          ColCount = 4
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
          ScrollBars = ssBoth
          TabOrder = 5
          OnGetFormat = MACSGGetFormat
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -11
          ActiveCellFont.Name = 'Tahoma'
          ActiveCellFont.Style = [fsBold]
          ColumnHeaders.Strings = (
            'Port    '
            'VID      '
            'MAC-address   '
            'Type  ')
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
          ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -11
          FilterDropDown.Font.Name = 'MS Sans Serif'
          FilterDropDown.Font.Style = []
          FilterDropDownClear = '(All)'
          FixedColWidth = 66
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
          PrintSettings.Font.Name = 'MS Sans Serif'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -11
          PrintSettings.FixedFont.Name = 'MS Sans Serif'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -11
          PrintSettings.HeaderFont.Name = 'MS Sans Serif'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -11
          PrintSettings.FooterFont.Name = 'MS Sans Serif'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -11
          SearchFooter.Font.Name = 'MS Sans Serif'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurence'
          SearchFooter.HintFindPrev = 'Find previous occurence'
          SearchFooter.HintHighlight = 'Highlight occurences'
          SearchFooter.MatchCaseCaption = 'Match case'
          ShowDesignHelper = False
          SortSettings.Show = True
          Version = '5.8.0.5'
          ColWidths = (
            66
            72
            111
            82)
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'IMP Port Settings'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object IMPPORTSG: TAdvStringGrid
        Left = 3
        Top = 3
        Width = 450
        Height = 342
        Cursor = crDefault
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetFormat = IMPSGGetFormat
        OnCustomCompare = DHCPSGCustomCompare
        OnGetEditorType = IMPPORTSGGetEditorType
        OnComboChange = IMPPORTSGComboChange
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'Port      '
          'Status  '
          'Allow Zero IP'
          'Forward DHCP'
          'Max Entry')
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
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 38
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
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.Show = True
        Version = '5.8.0.5'
        ColWidths = (
          38
          74
          80
          89
          64)
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'IMP Entry'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object IMPSG: TAdvStringGrid
        Left = 3
        Top = 3
        Width = 450
        Height = 348
        Cursor = crDefault
        ColCount = 4
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        PopupMenu = ImpPopUp
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetFormat = IMPSGGetFormat
        OnCustomCompare = DHCPSGCustomCompare
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'IP  '
          'MAC-address      '
          'Status  '
          'Type  ')
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
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 101
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
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.Show = True
        Version = '5.8.0.5'
        ColWidths = (
          101
          113
          80
          60)
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'DHCP Snooping Entry'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DHCPSG: TAdvStringGrid
        Left = 3
        Top = 3
        Width = 450
        Height = 343
        Cursor = crDefault
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        PopupMenu = DHCPPopUp
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetFormat = DHCPSGGetFormat
        OnCustomCompare = DHCPSGCustomCompare
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'IP'
          'MAC-address      '
          'Port'
          'Lease'
          'Status')
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
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 92
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
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.Show = True
        Version = '5.8.0.5'
        ColWidths = (
          92
          94
          43
          48
          55)
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Mac Block Table'
      ImageIndex = 4
      object MBSG: TAdvStringGrid
        Left = 3
        Top = 5
        Width = 453
        Height = 341
        Cursor = crDefault
        ColCount = 6
        DrawingStyle = gdsClassic
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        PopupMenu = MbPopUp
        ScrollBars = ssBoth
        TabOrder = 0
        OnGetFormat = DHCPSGGetFormat
        OnCustomCompare = DHCPSGCustomCompare
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ColumnHeaders.Strings = (
          'VID'
          'MAC-address      '
          'VLAN NAME'
          'Port'
          'Type'
          'Status')
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
        ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'MS Sans Serif'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 41
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
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'MS Sans Serif'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'MS Sans Serif'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'MS Sans Serif'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'MS Sans Serif'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurence'
        SearchFooter.HintFindPrev = 'Find previous occurence'
        SearchFooter.HintHighlight = 'Highlight occurences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowDesignHelper = False
        SortSettings.Show = True
        Version = '5.8.0.5'
        ColWidths = (
          41
          104
          73
          47
          85
          77)
      end
    end
  end
  object PSLPopUp: TPopupMenu
    TrackButton = tbLeftButton
    OnPopup = PortSLPopUp
    Left = 79
    Top = 144
    object Btn1: TMenuItem
      OnClick = Btn1Click
    end
    object DownUP1: TMenuItem
      Caption = 'Down < - > UP'
      OnClick = DownUP1Click
    end
  end
  object PingCl: TIdIcmpClient
    ReceiveTimeout = 100
    Protocol = 1
    ProtocolIPv6 = 0
    IPVersion = Id_IPv4
    PacketSize = 32
    Left = 783
  end
  object MainMenu1: TMainMenu
    Left = 720
    object Main1: TMenuItem
      Caption = 'Main'
      object Connect1: TMenuItem
        Caption = 'Connect'
        ShortCut = 32835
        OnClick = Connect1Click
      end
      object MBSrch: TMenuItem
        Caption = 'MacBlock Srch'
        Visible = False
        OnClick = MBSrchClick
      end
      object MacSrch1: TMenuItem
        Caption = 'MacSrch'
        Visible = False
        OnClick = MacSrch1Click
      end
      object Net1: TMenuItem
        Caption = 'Net Search'
        Visible = False
        OnClick = Net1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Ser1: TMenuItem
      Caption = 'Services'
      object Options1: TMenuItem
        Caption = 'Options'
        OnClick = Options1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object IMPSgSd: TFileSaveDialog
    DefaultExtension = '*.xls'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Excel Files'
        FileMask = '*.xls'
      end>
    Options = [fdoOverWritePrompt]
    Left = 64
    Top = 560
  end
  object DHCPSgSd: TFileSaveDialog
    DefaultExtension = '*.xls'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Excel Files'
        FileMask = '*.xls'
      end>
    Options = [fdoOverWritePrompt]
    Left = 120
    Top = 560
  end
  object MbSgSd: TFileSaveDialog
    DefaultExtension = '*.xls'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Excel Files'
        FileMask = '*.xls'
      end>
    Options = [fdoOverWritePrompt]
    Left = 256
    Top = 560
  end
  object DHCPEx: TAdvGridExcelIO
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    Version = '3.2.1'
    Left = 176
    Top = 560
  end
  object MbEx: TAdvGridExcelIO
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    Version = '3.2.1'
    Left = 296
    Top = 560
  end
  object ImpPopUp: TPopupMenu
    Left = 16
    Top = 560
    object MenuItem1: TMenuItem
      Caption = 'Export to Excell'
      OnClick = MenuItem1Click
    end
  end
  object DHCPPopUp: TPopupMenu
    Left = 208
    Top = 560
    object MenuItem2: TMenuItem
      Caption = 'Export to Excell'
      OnClick = MenuItem2Click
    end
  end
  object MbPopUp: TPopupMenu
    Left = 336
    Top = 560
    object MenuItem3: TMenuItem
      Caption = 'Export to Excell'
      OnClick = MenuItem3Click
    end
  end
  object ZC_MDB: TZConnection
    Properties.Strings = (
      'codepage=utf8')
    Protocol = 'postgresql'
    Left = 24
    Top = 448
  end
  object ZQ_MDB: TZQuery
    Connection = ZC_MDB
    Params = <>
    Left = 80
    Top = 448
  end
  object MacPopUp: TPopupMenu
    Left = 80
    Top = 344
    object ExporttoExcell1: TMenuItem
      Caption = 'Export to Excell'
      OnClick = ExporttoExcell1Click
    end
  end
  object MacSgSd: TFileSaveDialog
    DefaultExtension = '*.xls'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Excel Files'
        FileMask = '*.xls'
      end>
    Options = [fdoOverWritePrompt]
    Left = 144
    Top = 344
  end
  object MACSGEx: TAdvGridExcelIO
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    Version = '3.2.1'
    Left = 208
    Top = 344
  end
  object ImpEx: TAdvGridExcelIO
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportRawRTF = False
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    Version = '3.2.1'
    Left = 328
    Top = 400
  end
end
