object AboutBox: TAboutBox
  Left = 445
  Top = 127
  ActiveControl = OKButton
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 218
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    BevelOuter = bvLowered
    TabOrder = 0
    object ProductName: TLabel
      Left = 8
      Top = 8
      Width = 57
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'MDI test job'
      IsControl = True
    end
    object Version: TLabel
      Left = 8
      Top = 32
      Width = 24
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '1.0.0'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 80
      Width = 81
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #169' Ravil Nagimov'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 104
      Width = 120
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'nagimov.ravil@gmail.com'
      WordWrap = True
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 120
    Top = 178
    Width = 65
    Height = 33
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    IsControl = True
  end
end