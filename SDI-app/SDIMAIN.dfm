﻿object SDIAppForm: TSDIAppForm
  Left = 197
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'SDI Application'
  ClientHeight = 194
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 63
    Height = 16
    Caption = #1060#1072#1084#1080#1083#1080#1080
  end
  object Суммы: TLabel
    Left = 144
    Top = 4
    Width = 45
    Height = 16
    Caption = #1057#1091#1084#1084#1099
  end
  object Label2: TLabel
    Left = 280
    Top = 96
    Width = 43
    Height = 16
    Caption = #1057#1091#1084#1084#1072
  end
  object ListBox1: TListBox
    Left = 8
    Top = 26
    Width = 121
    Height = 116
    TabOrder = 0
  end
  object ListBox2: TListBox
    Left = 144
    Top = 26
    Width = 121
    Height = 116
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 280
    Top = 4
    Width = 169
    Height = 77
    Caption = #1056#1077#1078#1080#1084
    Enabled = False
    Items.Strings = (
      #1057' '#1076#1091#1073#1083#1080#1082#1072#1090#1072#1084#1080
      #1041#1077#1079' '#1076#1091#1073#1083#1080#1082#1072#1090#1086#1074)
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 156
    Width = 121
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 156
    Width = 121
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 280
    Top = 118
    Width = 169
    Height = 24
    Enabled = False
    TabOrder = 5
  end
  object BtnClear: TButton
    Left = 144
    Top = 156
    Width = 121
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 6
    OnClick = BtnClearClick
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 152
    object File1: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      Hint = 'File related commands'
      object FileOpenItem: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100
        Hint = 'Open|Open a file'
        ImageIndex = 7
        ShortCut = 16463
        OnClick = FileOpen1Execute
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Caption = '&'#1042#1099#1093#1086#1076
        Hint = 'Exit|Exit application'
        OnClick = FileExit1Execute
      end
    end
    object Help1: TMenuItem
      Caption = '&'#1055#1086#1084#1086#1097#1100
      Hint = 'Help topics'
      object HelpAboutItem: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        Hint = 
          'About|Displays program information, version number, and copyrigh' +
          't'
        OnClick = HelpAbout1Execute
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Excel Files (*.xls;*.xlsx;*.xlsm)|*.xls;*.xlsx;*.xlsm'
    Left = 273
    Top = 152
  end
end
