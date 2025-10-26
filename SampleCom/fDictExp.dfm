object frmDictExp: TfrmDictExp
  Left = 0
  Top = 0
  Caption = #1057#1083#1086#1074#1072#1088#1100' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1081
  ClientHeight = 462
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    784
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object mFileDictExp: TMemo
    Left = 0
    Top = 0
    Width = 655
    Height = 360
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object lbSections: TListBox
    Left = 661
    Top = 0
    Width = 121
    Height = 218
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 364
    Width = 784
    Height = 98
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      784
      98)
    object btnLoad: TButton
      Left = 8
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 0
      OnClick = btnLoadClick
    end
    object btnSave: TButton
      Left = 8
      Top = 65
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnSections: TButton
      Left = 100
      Top = 34
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1077#1082#1094#1080#1080
      TabOrder = 2
      OnClick = btnSectionsClick
    end
    object btnParams: TButton
      Left = 100
      Top = 65
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      TabOrder = 3
      OnClick = btnParamsClick
    end
    object Button1: TButton
      Left = 352
      Top = 56
      Width = 113
      Height = 25
      Caption = #1059#1076#1072#1088#1077#1085#1080#1077
      TabOrder = 4
      OnClick = Button1Click
    end
    object Edit1: TComboBox
      Left = 352
      Top = 16
      Width = 329
      Height = 21
      ItemIndex = 0
      TabOrder = 5
      Text = '; '#1089#1090#1088#1086#1082#1072'-'#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      Items.Strings = (
        '; '#1089#1090#1088#1086#1082#1072'-'#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        '[section1]'
        'param11 ; '#1087#1072#1088#1072#1084#1077#1090#1077#1088' '#1089' '#1082#1086#1084#1077#1085#1090#1072#1088#1080#1077#1084
        'param12'
        '[section2] ; '#1089#1077#1082#1094#1080#1103' '#1089' '#1082#1086#1084#1077#1085#1090#1072#1088#1080#1077#1084
        'param21 ; '#1087#1072#1088#1072#1084#1077#1090#1077#1088' '#1089' '#1082#1086#1084#1077#1085#1090#1072#1088#1080#1077#1084
        'param22'
        'param1;param2,param3-param4')
    end
    object Button2: TButton
      Left = 568
      Top = 56
      Width = 113
      Height = 25
      Caption = '[]'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object lbParams: TListBox
    Left = 661
    Top = 224
    Width = 121
    Height = 134
    Anchors = [akTop, akRight]
    ItemHeight = 13
    TabOrder = 3
  end
end
