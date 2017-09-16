object PingForm: TPingForm
  Left = 635
  Top = 153
  Caption = 'AllPinger'
  ClientHeight = 657
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 4
    Width = 46
    Height = 13
    Caption = 'Ip Adress'
  end
  object Label2: TLabel
    Left = 224
    Top = 6
    Width = 70
    Height = 13
    Caption = 'Size of  Packet'
  end
  object Label3: TLabel
    Left = 345
    Top = 2
    Width = 61
    Height = 13
    Caption = 'Ping Interval'
  end
  object ResultImg: TImage
    Left = 8
    Top = 232
    Width = 500
    Height = 383
    ParentShowHint = False
    Proportional = True
    ShowHint = True
    OnMouseDown = ResultImgMouseDown
    OnMouseMove = ResultImgMouseMove
    OnMouseUp = ResultImgMouseUp
  end
  object IPEdit1: TEdit
    Left = 8
    Top = 23
    Width = 127
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '192.168.95.1'
    OnKeyDown = IPEdit1KeyDown
  end
  object Button1: TButton
    Left = 142
    Top = 22
    Width = 45
    Height = 27
    Caption = '<<<'
    TabOrder = 1
    OnClick = Button1Click
  end
  object PctSizeBtn1: TUpDown
    Left = 287
    Top = 23
    Width = 17
    Height = 26
    Associate = PctSizeEdit1
    Max = 10000
    Position = 32
    TabOrder = 2
    Thousands = False
  end
  object PctSizeEdit1: TEdit
    Left = 222
    Top = 23
    Width = 65
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '32'
    OnChange = PctSizeEdit1Change
  end
  object PingBtn1: TButton
    Left = 427
    Top = 87
    Width = 81
    Height = 106
    Caption = 'Start'
    TabOrder = 4
    OnClick = PingBtn1Click
  end
  object ResultMemo: TMemo
    Left = 8
    Top = 64
    Width = 409
    Height = 129
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object StatEdit: TEdit
    Left = 8
    Top = 199
    Width = 409
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object StatSaveBtn: TButton
    Left = 427
    Top = 199
    Width = 81
    Height = 25
    Caption = #1048#1090#1086#1075' '#1074' ...'
    TabOrder = 7
    OnClick = StatSaveBtnClick
  end
  object PingIntEdit: TEdit
    Left = 345
    Top = 21
    Width = 55
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = '1000'
    OnChange = PingIntEditChange
  end
  object PingIntBtn: TUpDown
    Left = 400
    Top = 21
    Width = 17
    Height = 26
    Associate = PingIntEdit
    Min = 1
    Max = 10000
    Position = 1000
    TabOrder = 9
    Thousands = False
  end
  object CheckBox1: TCheckBox
    Left = 427
    Top = 64
    Width = 81
    Height = 17
    Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100
    TabOrder = 10
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 638
    Width = 534
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object CheckBox2: TCheckBox
    Left = 427
    Top = 41
    Width = 97
    Height = 17
    Caption = ' Alarm!'
    TabOrder = 12
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 104
    Top = 160
  end
  object SaveDialog2: TSaveDialog
    Filter = 'Text Files (*.txt)|*.txt'
    Left = 144
    Top = 160
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg'
    Left = 184
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    Left = 224
    Top = 160
    object SaveImageAs1: TMenuItem
      Caption = 'Save Image As...'
      OnClick = SaveImageAs1Click
    end
  end
end
