object SrchForm: TSrchForm
  Left = 0
  Top = 0
  Caption = 'SrchForm'
  ClientHeight = 329
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 869
    Height = 288
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object RezSG: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 867
      Height = 286
      Cursor = crDefault
      Align = alClient
      ColCount = 7
      DrawingStyle = gdsClassic
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnMouseUp = RezSGMouseUp
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
      FixedColWidth = 114
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
      SortSettings.Show = True
      SortSettings.IgnoreBlanks = True
      SortSettings.BlankPos = blLast
      SortSettings.UndoSort = True
      Version = '5.8.0.5'
      WordWrap = False
      ColWidths = (
        114
        152
        71
        207
        116
        138
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 869
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 141
      Top = 14
      Width = 4
      Height = 13
      Caption = '-'
    end
    object Label2: TLabel
      Left = 290
      Top = 12
      Width = 242
      Height = 23
      Caption = #1056#1072#1073#1086#1090#1072#1102#1097#1080#1093' '#1082#1086#1084#1084#1091#1090#1072#1090#1086#1088#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object NLab: TLabel
      Left = 544
      Top = 12
      Width = 11
      Height = 25
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 197
      Top = 11
      Width = 75
      Height = 21
      Caption = 'Scan'
      TabOrder = 3
      OnClick = Button1Click
    end
    object endEd: TEdit
      Left = 150
      Top = 11
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '254'
    end
    object startEd: TEdit
      Left = 95
      Top = 11
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '2'
    end
    object mainEd: TEdit
      Left = 8
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 0
      Text = '192.168.95.'
    end
  end
  object PUM: TPopupMenu
    Left = 592
    Top = 272
    object Savegridtodhcpconf1: TMenuItem
      Caption = 'Save grid to dhcp conf'
      OnClick = Savegridtodhcpconf1Click
    end
    object SaveasCVS1: TMenuItem
      Caption = 'Save grid as...'
      OnClick = SaveasCVS1Click
    end
  end
  object SD: TSaveDialog
    Filter = 'Excell Files(*.xls)|*.xls|Common Separated (*.csv)|*.csv'
    Left = 656
    Top = 272
  end
end
