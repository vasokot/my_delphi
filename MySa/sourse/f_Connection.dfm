object ConForm: TConForm
  Left = 216
  Top = 282
  Caption = 'Connection'
  ClientHeight = 104
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 43
    Height = 21
    Caption = 'Login'
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
    Width = 74
    Height = 21
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Times'
    Font.Style = []
    ParentFont = False
  end
  object LogEdit: TEdit
    Left = 96
    Top = 8
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object PasEdit: TEdit
    Left = 96
    Top = 45
    Width = 113
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PasEditKeyPress
  end
  object ConBtn: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = ConBtnClick
  end
  object Button3: TButton
    Left = 134
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = Button3Click
  end
end
