object frmTest: TfrmTest
  Left = 0
  Top = 0
  Caption = 'frmTest'
  ClientHeight = 699
  ClientWidth = 1062
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Label11: TLabel
    Left = 18
    Top = 39
    Width = 46
    Height = 13
    Caption = #1055#1086#1083'/'#1088#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblCurrFileName: TLabel
    Left = 14
    Top = 532
    Width = 74
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'lblCurrFileName'
  end
  object eFIO: TComboBox
    Left = 17
    Top = 8
    Width = 424
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = #1055#1091#1096#1082#1080#1085' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1057#1077#1088#1075#1077#1077#1074#1080#1095
    OnChange = eFIOChange
    Items.Strings = (
      #1055#1091#1096#1082#1080#1085' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1057#1077#1088#1075#1077#1077#1074#1080#1095
      #1043#1072#1084#1079#1072#1090#1086#1074#1072' '#1040#1083#1080#1103' '#1056#1091#1089#1090#1072#1084#1086#1074#1085#1072
      #1051#1086#1084#1086#1085#1086#1089#1086#1074' '#1052#1080#1093#1072#1081#1083#1086' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
      #1043#1072#1083#1103#1091#1090#1076#1080#1085#1086#1074#1072' '#1040#1083#1100#1092#1080#1103' '#1040#1073#1076#1091#1083#1083#1072#1077#1074#1085#1072
      #1042#1099#1089#1086#1094#1082#1080#1081' '#1042#1083#1072#1076#1080#1084#1080#1088' '#1057#1077#1084#1077#1085#1086#1074#1080#1095
      #1043#1086#1075#1086#1083#1100' '#1053#1080#1082#1086#1083#1072#1081' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
      #1057#1083#1080#1079#1082#1072' '#1051#1102#1073#1086#1074#1100' '#1042#1080#1082#1090#1086#1088#1086#1074#1085#1072
      #1063#1080#1082#1086#1074#1072#1085#1080' '#1058#1072#1090#1100#1103#1085#1072' '#1050#1080#1084#1086#1074#1085#1072
      #1054#1085#1091#1082' '#1057#1077#1088#1075#1077#1081' '#1042#1080#1082#1090#1086#1088#1086#1074#1080#1095
      #1045#1085#1072' '#1042#1080#1090#1072#1083#1080#1081' '#1053#1080#1082#1086#1083#1072#1077#1074#1080#1095
      #1051#1086#1084#1072#1082#1072' '#1042#1083#1072#1076#1080#1084#1080#1088' '#1052#1080#1093#1072#1081#1083#1086#1074#1080#1095
      #1044#1078#1091#1075#1072#1096#1074#1080#1083#1083#1080' '#1048#1086#1089#1080#1092' '#1042#1080#1089#1089#1072#1088#1080#1086#1085#1086#1074#1080#1095
      #1053#1072#1076#1086#1103#1085' '#1043#1088#1080#1096#1072' '#1057#1077#1088#1077#1078#1072#1077#1074#1080#1095
      #1057#1072#1072#1082#1103#1085' '#1052#1080#1096#1072' '#1040#1088#1090#1091#1096#1086#1074#1080#1095
      #1052#1091#1082#1072#1084#1072#1077#1074' '#1052#1080#1096#1072' '#1044#1072#1074#1083#1077#1090#1103#1085#1086#1074#1080#1095
      #1055#1099#1082#1096#1072' '#1058#1072#1090#1100#1103#1085#1072' '#1053#1080#1082#1086#1083#1072#1077#1074#1085#1072
      #1064#1072#1081#1093#1072#1090#1090#1072#1088#1086#1074#1072' '#1052#1091#1083#1103#1091#1096#1072' '#1048#1088#1092#1072#1085#1086#1074#1085#1072
      #1060#1072#1079#1083#1099#1077#1074#1072' '#1040#1081#1075#1091#1083#1100' '#1053#1091#1088#1091#1083#1083#1086#1074#1085#1072
      #1044#1080#1074#1086#1074' '#1041#1072#1081#1088#1072#1084' '#1040#1089#1082#1077#1088' '#1054#1075#1083#1099
      #1040#1089#1082#1077#1088'-'#1040#1083#1080'-P'#1072#1076#1077' '#1040#1076#1080#1083#1100' '#1058#1086#1092#1080#1082' '#1054#1075#1083#1099
      #1044#1072#1074#1083#1077#1090#1086#1074#1072' '#1047#1091#1083#1100#1092#1080#1103' '#1053#1080#1103#1079' '#1050#1099#1079#1099
      #1059#1090#1082#1080#1085'-'#1050#1088#1072#1084#1072#1090#1086#1088#1089#1082#1080#1081'-'#1047#1072#1076#1091#1085#1072#1081#1089#1082#1080#1081' '#1043#1072#1074#1088#1080#1083#1072' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
      #1050#1077#1085#1085#1077#1076#1080' '#1044#1078#1086#1085' '#1060#1080#1076#1078#1077#1088#1072#1083#1100#1076
      #1058#1074#1077#1085' '#1052#1072#1088#1082
      #1040#1084#1073#1072#1088#1094#1091#1084#1103#1085' '#1050#1072#1088#1077#1085' '#1043#1088#1072#1095#1080)
  end
  object Button1: TButton
    Left = 290
    Top = 34
    Width = 152
    Height = 26
    Caption = #1057#1082#1083#1086#1085#1103#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object eDeclension: TEdit
    Left = 17
    Top = 102
    Width = 425
    Height = 21
    TabOrder = 2
  end
  object cbPadeg: TComboBox
    Left = 171
    Top = 74
    Width = 270
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 205
    Top = 34
    Width = 78
    Height = 26
    Caption = #1048#1084#1103' '#1060#1072#1084#1080#1083#1080#1103
    TabOrder = 4
    OnClick = Button2Click
  end
  object rgSex: TComboBox
    Left = 69
    Top = 36
    Width = 121
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 2
    ParentFont = False
    TabOrder = 6
    Text = #1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085
    Items.Strings = (
      #1084#1091#1078#1089#1082#1086#1081
      #1078#1077#1085#1089#1082#1080#1081
      #1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085)
  end
  object Memo1: TMemo
    Left = 458
    Top = 0
    Width = 604
    Height = 684
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 5
    ExplicitWidth = 600
    ExplicitHeight = 683
  end
  object btnNomin: TButton
    Left = 18
    Top = 71
    Width = 152
    Height = 27
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1079
    TabOrder = 7
    OnClick = btnNominClick
  end
  object Button3: TButton
    Left = 377
    Top = 210
    Width = 64
    Height = 26
    Caption = #1057#1082#1083#1086#1085#1103#1090#1100
    TabOrder = 9
    OnClick = Button3Click
  end
  object btnOffice: TButton
    Left = 377
    Top = 247
    Width = 64
    Height = 27
    Caption = #1057#1082#1083#1086#1085#1103#1090#1100
    TabOrder = 11
    OnClick = btnOfficeClick
  end
  object btnGetFull: TButton
    Left = 17
    Top = 290
    Width = 424
    Height = 25
    Caption = #1057#1082#1083#1086#1085#1103#1090#1100' "'#1089#1086#1090#1088#1091#1076#1085#1080#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'"'
    TabOrder = 12
    OnClick = btnGetFullClick
  end
  object btnDict: TButton
    Left = 14
    Top = 329
    Width = 172
    Height = 26
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1089#1083#1086#1074#1072#1088#1077
    TabOrder = 13
    OnClick = btnDictClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 684
    Width = 1062
    Height = 15
    Panels = <>
    SimplePanel = True
    ExplicitTop = 683
    ExplicitWidth = 1058
  end
  object Button4: TButton
    Left = 268
    Top = 329
    Width = 173
    Height = 26
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1089#1083#1086#1074#1072#1088#1100
    TabOrder = 15
    OnClick = Button4Click
  end
  object eAppointment: TComboBox
    Left = 17
    Top = 212
    Width = 353
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1089#1084#1077#1085#1099
    OnChange = eAppointmentChange
    Items.Strings = (
      #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1089#1084#1077#1085#1099
      #1050#1086#1084#1072#1085#1076#1080#1088' '#1079#1074#1077#1085#1072
      #1043#1083#1072#1074#1085#1099#1081' '#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1072#1085#1080#1090#1072#1088#1085#1099#1081' '#1074#1088#1072#1095' '
      
        #1047#1072#1084#1077#1089#1090#1080#1090#1077#1083#1100' '#1085#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1086#1090#1076#1077#1083#1072' '#1087#1086' '#1089#1080#1089#1090#1077#1084#1077' '#1084#1077#1085#1077#1076#1078#1084#1077#1085#1090#1072' '#1082#1072#1095#1077#1089#1090#1074#1072' '#1080' ' +
        #1089#1090#1072#1085#1076#1072#1088#1090#1080#1079#1072#1094#1080#1080
      #1048#1085#1089#1087#1077#1082#1090#1086#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1089' '#1083#1080#1095#1085#1099#1084' '#1089#1086#1089#1090#1072#1074#1086#1084
      #1055#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
      #1055#1088#1080#1082#1072#1079)
  end
  object eOffice: TComboBox
    Left = 17
    Top = 250
    Width = 353
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 10
    Text = #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1089#1084#1077#1085#1072
    Items.Strings = (
      #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1089#1084#1077#1085#1072
      #1042#1077#1088#1090#1086#1083#1077#1090#1085#1086#1077' '#1079#1074#1077#1085#1086
      #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1094#1080#1103' '#1050#1086#1084#1080'-'#1055#1077#1088#1084#1103#1094#1082#1086#1075#1086' '#1072#1074#1090#1086#1085#1086#1084#1085#1086#1075#1086' '#1086#1082#1088#1091#1075#1072
      #1054#1090#1076#1077#1083' '#1087#1086' '#1089#1080#1089#1090#1077#1084#1077' '#1084#1077#1085#1077#1076#1078#1084#1077#1085#1090#1072' '#1082#1072#1095#1077#1089#1090#1074#1072' '#1080' '#1089#1090#1072#1085#1076#1072#1088#1090#1080#1079#1072#1094#1080#1080
      #1054#1090#1076#1077#1083#1077#1085#1080#1077' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1089' '#1083#1080#1095#1085#1099#1084' '#1089#1086#1089#1090#1072#1074#1086#1084
      #1057#1086#1074#1077#1090' '#1052#1080#1085#1080#1089#1090#1088#1086#1074)
  end
  object btnStart: TButton
    Left = 18
    Top = 126
    Width = 203
    Height = 27
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 16
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 235
    Top = 126
    Width = 203
    Height = 27
    Caption = #1057#1090#1086#1087
    TabOrder = 17
    OnClick = btnStopClick
  end
  object Button5: TButton
    Left = 269
    Top = 370
    Width = 173
    Height = 25
    Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
    TabOrder = 18
    OnClick = Button5Click
  end
  object eValue: TEdit
    Left = 17
    Top = 371
    Width = 245
    Height = 21
    TabOrder = 19
    Text = '123.456'
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 409
    Width = 430
    Height = 53
    Caption = 'NumberToString, SumInWords, DoubleToVerbal'
    TabOrder = 20
    object Label1: TLabel
      Left = 79
      Top = 24
      Width = 111
      Height = 13
      Caption = #1079#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
    end
    object l1: TLabel
      Left = 6
      Top = 25
      Width = 19
      Height = 13
      Caption = #1056#1086#1076
    end
    object seDecimal: TSpinEdit
      Left = 202
      Top = 21
      Width = 40
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 4
    end
    object cbSex: TComboBox
      Left = 33
      Top = 22
      Width = 36
      Height = 21
      TabOrder = 1
      Text = #1084
      Items.Strings = (
        #1089
        #1078
        #1084)
    end
    object cbFract: TCheckBox
      Left = 351
      Top = 24
      Width = 70
      Height = 18
      Caption = #1076#1088#1086#1073#1085#1086#1077
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbDelZero: TCheckBox
      Left = 252
      Top = 24
      Width = 94
      Height = 18
      Caption = #1091#1076#1072#1083#1103#1090#1100' '#1085#1091#1083#1080' '
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 17
    Top = 457
    Width = 425
    Height = 69
    Caption = 'DeclNumeral'
    TabOrder = 21
    object lblPadeg: TLabel
      Left = 10
      Top = 27
      Width = 34
      Height = 13
      Caption = #1055#1072#1076#1077#1078
    end
    object cbAnimate: TCheckBox
      Left = 278
      Top = 27
      Width = 102
      Height = 18
      Caption = #1086#1076#1091#1096#1077#1074#1083#1077#1085#1085#1086#1077
      TabOrder = 0
    end
    object cbTypeNumeral: TComboBox
      Left = 137
      Top = 25
      Width = 125
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1077#1085#1085#1086#1077
      Items.Strings = (
        #1082#1086#1083#1080#1095#1077#1089#1090#1074#1077#1085#1085#1086#1077
        #1087#1086#1088#1103#1076#1082#1086#1074#1086#1077)
    end
    object sePadeg: TSpinEdit
      Left = 51
      Top = 24
      Width = 69
      Height = 22
      MaxValue = 6
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 17
    Top = 546
    Width = 424
    Height = 58
    Caption = 'DeclCurrency'
    TabOrder = 22
    object Label2: TLabel
      Left = 3
      Top = 26
      Width = 39
      Height = 13
      Caption = #1042#1072#1083#1102#1090#1072
    end
    object lForms: TLabel
      Left = 264
      Top = 26
      Width = 74
      Height = 13
      Caption = #1060#1086#1088#1084#1072' '#1074#1099#1074#1086#1076#1072
    end
    object cbCurr: TComboBox
      Left = 49
      Top = 23
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object seForms: TSpinEdit
      Left = 351
      Top = 22
      Width = 70
      Height = 22
      MaxValue = 3
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object rgSource: TRadioGroup
    Left = 17
    Top = 603
    Width = 230
    Height = 75
    Caption = '5'
    Ctl3D = True
    DoubleBuffered = False
    ItemIndex = 0
    Items.Strings = (
      'DoubleToVerbal ('#1095#1080#1089#1083#1086' '#1087#1088#1086#1087#1080#1089#1100#1102')'
      'NumberToString ('#1095#1080#1089#1083#1086' '#1074' '#1089#1090#1088#1086#1082#1091')')
    ParentCtl3D = False
    ParentDoubleBuffered = False
    TabOrder = 23
  end
  object bNumDecl: TButton
    Left = 290
    Top = 631
    Width = 150
    Height = 27
    Caption = #1057#1082#1083#1086#1085#1103#1090#1100
    TabOrder = 24
    OnClick = bNumDeclClick
  end
  object btnFormingFIO: TButton
    Left = 286
    Top = 159
    Width = 152
    Height = 27
    Caption = 'FormingFIO'
    TabOrder = 25
    OnClick = btnFormingFIOClick
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1081' (*.dic)|*.dic|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 18
    Top = 181
  end
end
