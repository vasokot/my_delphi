object SetForm: TSetForm
  Left = 216
  Top = 133
  Caption = 'Settings'
  ClientHeight = 104
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 48
    Height = 21
    Caption = 'Server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 73
    Height = 21
    Caption = 'DB Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times'
    Font.Style = []
    ParentFont = False
  end
  object ServEdit: TEdit
    Left = 96
    Top = 8
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object DBEdit: TEdit
    Left = 96
    Top = 45
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object OkBtn: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = OkBtnClick
  end
  object CnlBtn: TButton
    Left = 134
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = CnlBtnClick
  end
end
