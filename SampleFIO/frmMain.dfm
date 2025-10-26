object frmMainDecl: TfrmMainDecl
  Left = 585
  Top = 165
  Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1080' '#1089#1082#1083#1086#1085#1077#1085#1080#1103
  ClientHeight = 486
  ClientWidth = 702
  Color = clBtnFace
  Constraints.MinHeight = 517
  Constraints.MinWidth = 714
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 471
    Width = 702
    Height = 15
    Panels = <>
    SimplePanel = True
    ExplicitTop = 470
    ExplicitWidth = 698
  end
  object pgcTop: TPageControl
    Left = 0
    Top = 0
    Width = 702
    Height = 252
    ActivePage = tsNum
    Align = alTop
    TabOrder = 1
    TabStop = False
    OnChange = pgcTopChange
    ExplicitWidth = 698
    object tsFIO: TTabSheet
      Caption = #1060#1048#1054
      object Label1: TLabel
        Left = 3
        Top = 48
        Width = 49
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 3
        Top = 82
        Width = 22
        Height = 13
        Caption = #1048#1084#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 3
        Top = 110
        Width = 47
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 3
        Top = 136
        Width = 139
        Height = 13
        Caption = #1042#1099#1073#1086#1088' '#1092#1091#1085#1082#1094#1080#1080' '#1089#1082#1083#1086#1085#1077#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 527
        Top = 110
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
      object cbSelectFunc: TComboBox
        Left = 152
        Top = 133
        Width = 197
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = 'GetFIOPadeg'
        OnChange = cbSelectFuncChange
        Items.Strings = (
          'GetFIOPadeg'
          'GetFIOPadegAS'
          'GetFIOPadegFS'
          'GetFIOPadegFSAS'
          'GetIFPadeg'
          'GetIFPadegFS')
      end
      object btnDecl: TButton
        Left = 3
        Top = 197
        Width = 679
        Height = 25
        Caption = #1057#1082#1083#1086#1085#1103#1090#1100' '#1060#1048#1054
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnDeclClick
      end
      object eF: TEdit
        Left = 58
        Top = 45
        Width = 463
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object eI: TEdit
        Left = 59
        Top = 75
        Width = 462
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object eO: TEdit
        Left = 60
        Top = 106
        Width = 462
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object btnSeparateFIO: TButton
        Left = 527
        Top = 14
        Width = 163
        Height = 24
        Caption = #1056#1072#1079#1073#1080#1090#1100' '#1060#1048#1054' '#1085#1072' '#1095#1072#1089#1090#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnSeparateFIOClick
      end
      object btnGetSex: TButton
        Left = 527
        Top = 45
        Width = 163
        Height = 24
        Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1087#1086#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnGetSexClick
      end
      object btnClearParts: TButton
        Left = 527
        Top = 75
        Width = 163
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1086#1089#1090#1072#1074#1083#1103#1102#1097#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = btnClearPartsClick
      end
      object Memo1: TMemo
        Left = 355
        Top = 131
        Width = 328
        Height = 55
        Color = clInactiveBorder
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          #1057#1082#1083#1086#1085#1077#1085#1080#1077' '#1092#1072#1084#1080#1083#1080#1080', '#1080#1084#1077#1085#1080' '#1080' '#1086#1090#1095#1077#1089#1090#1074#1072' '#1089' '#1103#1074#1085#1099#1084' '
          #1091#1082#1072#1079#1072#1085#1080#1077#1084' '#1088#1086#1076#1072'.')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object rgSex: TComboBox
        Left = 575
        Top = 106
        Width = 115
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Items.Strings = (
          #1084#1091#1078#1089#1082#1086#1081
          #1078#1077#1085#1089#1082#1080#1081
          #1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085)
      end
      object eFIO: TComboBox
        Left = 3
        Top = 19
        Width = 518
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 32
        ParentFont = False
        TabOrder = 10
        Text = #1052#1091#1093#1072#1084#1077#1090#1079#1103#1085#1086#1074' '#1057#1072#1083#1080#1084'-'#1043#1080#1088#1077#1081' '#1040#1093#1084#1077#1076#1086#1074#1080#1095
        OnSelect = eFIOSelect
        Items.Strings = (
          #1050#1083#1080#1085#1094#1077#1074' '#1042#1080#1082#1090#1086#1088' '#1043#1088#1080#1075#1086#1088#1100#1077#1074#1080#1095
          #1055#1091#1096#1082#1080#1085' '#1040#1083#1077#1082#1089#1072#1085#1076#1088' '#1057#1077#1088#1075#1077#1077#1074#1080#1095
          #1048#1074#1072#1085#1086#1074' '#1048#1074#1072#1085' '#1048#1074#1072#1085#1086#1074#1080#1095
          #1051#1086#1084#1086#1085#1086#1089#1086#1074' '#1052#1080#1093#1072#1081#1083#1086' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
          #1042#1099#1089#1086#1094#1082#1080#1081' '#1042#1083#1072#1076#1080#1084#1080#1088' '#1057#1077#1084#1077#1085#1086#1074#1080#1095
          #1052#1080#1094#1082#1077#1074#1080#1095' '#1052#1072#1088#1080#1103' '#1052#1080#1093#1072#1081#1083#1086#1074#1085#1072
          #1061#1080#1090#1088#1086#1074#1086' '#1053#1080#1082#1086#1083#1072#1081' '#1047#1072#1093#1072#1088#1086#1074#1080#1095
          #1055#1086#1083#1100#1089#1082#1080#1093' '#1043#1072#1083#1080#1085#1072' '#1040#1083#1077#1082#1089#1072#1085#1076#1088#1086#1074#1085#1072
          #1063#1077#1088#1085#1080'-'#1057#1090#1077#1092#1072#1085#1100#1089#1082#1072' '#1043#1072#1083#1080#1085#1072' '#1057#1090#1072#1085#1080#1089#1083#1072#1074#1086#1074#1085#1072
          #1043#1086#1075#1086#1083#1100' '#1053#1080#1082#1086#1083#1072#1081' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
          #1052#1077#1082#1089#1080#1082#1072#1085#1077#1094' '#1042#1080#1090#1072#1083#1080#1081' '#1055#1077#1090#1088#1086#1074#1080#1095
          #1057#1083#1080#1079#1082#1072' '#1051#1102#1073#1086#1074#1100' '#1042#1080#1082#1090#1086#1088#1086#1074#1085#1072
          #1063#1080#1082#1086#1074#1072#1085#1080' '#1058#1072#1090#1100#1103#1085#1072' '#1050#1080#1084#1086#1074#1085#1072
          #1058#1077#1088'-'#1048#1074#1072#1085#1086#1074' '#1042#1080#1083#1100#1103#1084' '#1050#1072#1088#1083#1086#1074#1080#1095
          #1054#1085#1091#1082' '#1057#1077#1088#1075#1077#1081' '#1042#1080#1082#1090#1086#1088#1086#1074#1080#1095
          #1045#1085#1072' '#1042#1080#1090#1072#1083#1080#1081' '#1053#1080#1082#1086#1083#1072#1077#1074#1080#1095
          #1051#1086#1084#1072#1082#1072' '#1042#1083#1072#1076#1080#1084#1080#1088' '#1052#1080#1093#1072#1081#1083#1086#1074#1080#1095
          #1044#1078#1091#1075#1072#1096#1074#1080#1083#1083#1080' '#1048#1086#1089#1080#1092' '#1042#1080#1089#1089#1072#1088#1080#1086#1085#1086#1074#1080#1095
          #1064#1085#1077#1087#1077#1088#1089#1086#1085' '#1048#1089#1088#1072#1080#1083#1100' '#1053#1072#1090#1072#1085#1086#1074#1080#1095
          #1063#1080#1088#1074#1072' '#1053#1080#1082#1086#1083#1100' '#1055#1077#1090#1088#1086#1074#1085#1072
          #1043#1072#1084#1079#1072#1090#1086#1074#1072' '#1040#1083#1080#1103' '#1056#1091#1089#1090#1072#1084#1086#1074#1085#1072
          #1043#1072#1083#1103#1091#1090#1076#1080#1085#1086#1074#1072' '#1040#1083#1100#1092#1080#1103' '#1040#1073#1076#1091#1083#1083#1072#1077#1074#1085#1072
          #1053#1072#1076#1086#1103#1085' '#1043#1088#1080#1096#1072' '#1057#1077#1088#1077#1078#1072#1077#1074#1080#1095
          #1052#1091#1082#1072#1084#1072#1077#1074' '#1052#1080#1096#1072' '#1044#1072#1074#1083#1077#1090#1103#1085#1086#1074#1080#1095
          #1055#1099#1082#1096#1072' '#1058#1072#1090#1100#1103#1085#1072' '#1053#1080#1082#1086#1083#1072#1077#1074#1085#1072
          #1064#1072#1081#1093#1072#1090#1090#1072#1088#1086#1074#1072' '#1052#1091#1083#1103#1091#1096#1072' '#1048#1088#1092#1072#1085#1086#1074#1085#1072
          #1060#1072#1079#1083#1099#1077#1074#1072' '#1040#1081#1075#1091#1083#1100' '#1053#1091#1088#1091#1083#1083#1086#1074#1085#1072
          #1044#1080#1074#1086#1074' '#1041#1072#1081#1088#1072#1084' '#1040#1089#1082#1077#1088' '#1054#1075#1083#1099
          #1040#1089#1082#1077#1088'-'#1040#1083#1080'-P'#1072#1076#1077' '#1040#1076#1080#1083#1100' '#1058#1086#1092#1080#1082' '#1054#1075#1083#1099
          #1044#1072#1074#1083#1077#1090#1086#1074#1072' '#1047#1091#1083#1100#1092#1080#1103' '#1053#1080#1103#1079' '#1050#1099#1079#1099
          #1059#1090#1082#1080#1085'-'#1050#1088#1072#1084#1072#1090#1086#1088#1089#1082#1080#1081'-'#1047#1072#1076#1091#1085#1072#1081#1089#1082#1080#1081' '#1043#1072#1074#1088#1080#1083#1072' '#1042#1072#1089#1080#1083#1100#1077#1074#1080#1095
          #1040#1084#1073#1072#1088#1094#1091#1084#1103#1085' '#1050#1072#1088#1077#1085' '#1043#1088#1072#1095#1080
          #1052#1091#1093#1072#1084#1077#1090#1079#1103#1085#1086#1074' '#1057#1072#1083#1080#1084'-'#1043#1080#1088#1077#1081' '#1040#1093#1084#1077#1076#1086#1074#1080#1095)
      end
      object btnStart: TButton
        Left = 3
        Top = 162
        Width = 84
        Height = 24
        Hint = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' GetFIOPadegFSAS '#1076#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1075#1086' '#1085#1072#1078#1072#1090#1080#1103' '#1057#1090#1086#1087
        Caption = #1057#1090#1072#1088#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = btnStartClick
      end
      object btnThread: TButton
        Left = 92
        Top = 162
        Width = 84
        Height = 24
        Caption = #1055#1086#1090#1086#1082#1080' ('#1090#1077#1089#1090')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnClick = btnThreadClick
      end
      object btnFormingFIO: TButton
        Left = 266
        Top = 162
        Width = 84
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #1048'.'#1054'.'#1060'. -> '#1060'.'#1048'.'#1054'.'
        TabOrder = 13
        OnClick = btnFormingFIOClick
      end
    end
    object tsOffice: TTabSheet
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080' '#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      ImageIndex = 1
      object Label12: TLabel
        Left = 6
        Top = 18
        Width = 61
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 6
        Top = 70
        Width = 83
        Height = 13
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btnApp: TButton
        Left = 6
        Top = 153
        Width = 148
        Height = 25
        Caption = #1057#1082#1083#1086#1085#1103#1090#1100' '#1076#1086#1083#1078#1085#1086#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnAppClick
      end
      object btnOff: TButton
        Left = 176
        Top = 153
        Width = 148
        Height = 25
        Caption = #1057#1082#1083#1086#1085#1103#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnOffClick
      end
      object btnAppOff: TButton
        Left = 358
        Top = 153
        Width = 317
        Height = 25
        Caption = #1057#1082#1083#1086#1085#1103#1090#1100' "'#1089#1086#1090#1088#1091#1076#1085#1080#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103'"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnAppOffClick
      end
      object eAppointment: TComboBox
        Left = 73
        Top = 15
        Width = 597
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081
        OnChange = eAppointmentChange
        Items.Strings = (
          #1042#1077#1076#1091#1097#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088' - '#1088#1077#1074#1080#1079#1086#1088
          #1042#1077#1076#1091#1097#1080#1081' '#1080#1085#1078#1077#1085#1077#1088
          #1043#1083#1072#1074#1085#1099#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
          #1043#1083#1072#1074#1085#1099#1081' '#1075#1086#1089#1091#1076#1072#1088#1089#1090#1074#1077#1085#1085#1099#1081' '#1089#1072#1085#1080#1090#1072#1088#1085#1099#1081' '#1074#1088#1072#1095' '
          #1043#1083#1072#1074#1085#1099#1081' '#1080#1085#1078'. '#1087#1088'-'#1074#1072
          #1047#1072#1074'. '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1080#1077#1081
          #1047#1072#1074#1077#1076#1091#1102#1097#1072#1103
          #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081
          #1047#1072#1074#1077#1076#1091#1102#1097#1080#1081' '#1086#1090#1076#1077#1083#1077#1085#1080#1077#1084
          #1047#1072#1084'. '#1087#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1103
          #1047#1072#1084#1077#1089#1090#1080#1090#1077#1083#1100' '#1085#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1086#1090#1076#1077#1083#1072
          #1048#1085#1078#1077#1085#1077#1088' 1-'#1086#1081' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
          #1048#1085#1078#1077#1085#1077#1088' '#1089#1090#1072#1078#1077#1088
          #1048#1085#1078#1077#1085#1077#1088'-'#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090
          #1048#1085#1089#1087#1077#1082#1090#1086#1088' '#1086#1090#1076#1077#1083#1077#1085#1080#1103' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1089' '#1083#1080#1095#1085#1099#1084' '#1089#1086#1089#1090#1072#1074#1086#1084
          #1050#1072#1087#1080#1090#1072#1085'-'#1083#1077#1081#1090#1077#1085#1072#1085#1090
          #1050#1086#1084#1072#1085#1076#1080#1088' '#1079#1074#1077#1085#1072
          #1050#1086#1084#1072#1085#1076#1080#1088' '#1087#1086#1083#1082#1072
          #1052#1080#1085#1080#1089#1090#1088' '#1079#1076#1088#1072#1074#1086#1086#1093#1088#1072#1085#1077#1085#1080#1103
          #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072
          #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1087#1088'-'#1074#1072
          #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1089#1084#1077#1085#1099
          #1055#1086#1084#1086#1097#1085#1080#1082' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103' '#1087#1088#1080#1077#1084#1085#1086#1081' ('#1054#1054#1054' "'#1055#1072#1088#1090#1085#1077#1088'")'
          #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081
          #1059#1087#1088#1072#1074#1083#1103#1102#1097#1080#1081' '#1076#1077#1083#1072#1084#1080)
      end
      object eOffice: TComboBox
        Left = 98
        Top = 67
        Width = 577
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1094#1080#1103' '#1044#1050
        Items.Strings = (
          '1-'#1072#1103' '#1073#1072#1079#1072
          '2-'#1086#1081' '#1089#1082#1083#1072#1076
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1094#1080#1103
          #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1094#1080#1103' '#1044#1050
          #1040#1082#1094#1080#1086#1085#1077#1088#1085#1086#1077' '#1086#1073#1097#1077#1089#1090#1074#1086
          #1042#1077#1088#1090#1086#1083#1077#1090#1085#1086#1077' '#1079#1074#1077#1085#1086
          #1042#1077#1095#1077#1088#1085#1103#1103' ('#1089#1084#1077#1085#1085#1072#1103') '#1086#1073#1097#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1077#1083#1100#1085#1072#1103' '#1096#1082#1086#1083#1072
          #1044#1080#1074#1080#1079#1080#1086#1085' '#1090#1086#1088#1087#1077#1076#1085#1099#1093' '#1082#1072#1090#1077#1088#1086#1074
          #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072#1083#1100#1085#1086#1077' '#1087#1088'-'#1074#1086
          #1048#1058'-'#1086#1090#1076#1077#1083
          #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1080#1081' '#1086#1090#1076'.'
          #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1086#1077' '#1073#1102#1088#1086
          #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1086'-'#1090#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1086#1090#1076#1077#1083
          #1051#1072#1073'. '#1089#1087#1077#1082#1090#1088#1072#1083#1100#1085#1086#1075#1086' '#1072#1085#1072#1083#1080#1079#1072
          #1051#1072#1073#1086#1088#1072#1090#1086#1088#1080#1103' '#1093#1080#1084'. '#1072#1085#1072#1083#1080#1079#1072
          #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1081' '#1082#1086#1083#1083#1077#1076#1078
          #1052#1080#1085#1080#1089#1090#1077#1088#1089#1090#1074#1086' '#1079#1076#1088#1072#1074#1086#1086#1093#1088#1072#1085#1077#1085#1080#1103
          #1053#1050#1042#1044
          #1054#1040#1054' '#171#1053#1072#1091#1095#1085#1086'-'#1080#1089#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1081' '#1101#1083#1077#1082#1090#1088#1086#1084#1077#1093#1072#1085#1080#1095#1077#1089#1082#1080#1081' '#1080#1085#1089#1090#1080#1090#1091#1090#187
          
            #1054#1054#1054' '#171#1057#1077#1074#1077#1088#1086'-'#1047#1072#1087#1072#1076#1085#1072#1103' '#1051#1086#1075#1080#1089#1090#1080#1095#1077#1089#1082#1072#1103' '#1082#1086#1084#1087#1072#1085#1080#1103#187' '#1042#1086#1083#1086#1075#1086#1076#1089#1082#1086#1077' '#1090#1077#1088#1088#1080#1090#1086 +
            #1088#1080#1072#1083#1100#1085#1086#1077' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077
          #1054#1090#1076#1077#1083' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1093' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1081
          #1054#1090#1076#1077#1083' '#1082#1072#1076#1088#1086#1074
          #1054#1090#1076#1077#1083' '#1087#1086' '#1089#1080#1089#1090#1077#1084#1077' '#1084#1077#1085#1077#1076#1078#1084#1077#1085#1090#1072' '#1082#1072#1095#1077#1089#1090#1074#1072' '#1080' '#1089#1090#1072#1085#1076#1072#1088#1090#1080#1079#1072#1094#1080#1080
          #1054#1090#1076#1077#1083#1077#1085#1080#1077' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1089' '#1083#1080#1095#1085#1099#1084' '#1089#1086#1089#1090#1072#1074#1086#1084
          #1054#1090#1076#1077#1083#1077#1085#1080#1077' '#1089#1086#1089#1091#1076#1080#1089#1090#1086#1081' '#1093#1080#1088#1091#1088#1075#1080#1080
          #1055#1088#1080#1077#1084#1085#1072#1103' ('#1054#1054#1054' "'#1055#1072#1088#1090#1085#1077#1088'")'
          #1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1089#1084#1077#1085#1072
          #1055#1088#1086#1092#1077#1089#1089#1080#1086#1085#1072#1083#1100#1085#1086'-'#1090#1077#1093#1085#1080#1095#1077#1089#1082#1086#1077' '#1091#1095#1080#1083#1080#1097#1077
          #1057#1086#1074#1077#1090' '#1052#1080#1085#1080#1089#1090#1088#1086#1074)
      end
      object btn1: TButton
        Left = 176
        Top = 184
        Width = 148
        Height = 25
        Caption = #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' 3 '#1088#1072#1079#1072
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btn1Click
      end
    end
    object tsNum: TTabSheet
      Caption = #1063#1080#1089#1083#1080#1090#1077#1083#1100#1085#1099#1077' '#1080' '#1074#1072#1083#1102#1090#1072
      ImageIndex = 2
      OnShow = tsNumShow
      object Label16: TLabel
        Left = 3
        Top = 7
        Width = 73
        Height = 13
        Caption = #1063#1080#1089#1083#1080#1090#1077#1083#1100#1085#1086#1077
      end
      object btnTest: TButton
        Left = 473
        Top = 49
        Width = 217
        Height = 24
        Caption = #1055#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1090#1100
        TabOrder = 0
        OnClick = btnTestClick
      end
      object rgSource: TRadioGroup
        Left = 473
        Top = 106
        Width = 217
        Height = 71
        Caption = '5'
        Ctl3D = True
        DoubleBuffered = False
        ItemIndex = 0
        Items.Strings = (
          'DoubleToVerbal ('#1095#1080#1089#1083#1086' '#1087#1088#1086#1087#1080#1089#1100#1102')'
          'NumberToString ('#1095#1080#1089#1083#1086' '#1074' '#1089#1090#1088#1086#1082#1091')')
        ParentCtl3D = False
        ParentDoubleBuffered = False
        TabOrder = 1
      end
      object bDeclNum: TButton
        Left = 473
        Top = 183
        Width = 217
        Height = 25
        Caption = #1057#1082#1083#1086#1085#1103#1090#1100
        TabOrder = 2
        OnClick = bDeclNumClick
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 30
        Width = 411
        Height = 56
        Caption = 'NumberToString, SumInWords, DoubleToVerbal'
        TabOrder = 3
        object Label15: TLabel
          Left = 71
          Top = 24
          Width = 113
          Height = 13
          Caption = #1079#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
        end
        object l1: TLabel
          Left = 6
          Top = 24
          Width = 19
          Height = 13
          Caption = #1056#1086#1076
        end
        object seDecimal: TSpinEdit
          Left = 188
          Top = 21
          Width = 38
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 4
        end
        object cbSex: TComboBox
          Left = 30
          Top = 21
          Width = 35
          Height = 21
          TabOrder = 1
          Text = #1084
          Items.Strings = (
            #1089
            #1078
            #1084)
        end
        object cbFract: TCheckBox
          Left = 331
          Top = 22
          Width = 65
          Height = 17
          Caption = #1076#1088#1086#1073#1085#1086#1077
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbDelZero: TCheckBox
          Left = 238
          Top = 22
          Width = 87
          Height = 17
          Caption = #1091#1076#1072#1083#1103#1090#1100' '#1085#1091#1083#1080' '
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 91
        Width = 412
        Height = 55
        Caption = 'DeclNumeral'
        TabOrder = 4
        object lblPadeg: TLabel
          Left = 9
          Top = 26
          Width = 34
          Height = 13
          Caption = #1055#1072#1076#1077#1078
        end
        object cbAnimate: TCheckBox
          Left = 314
          Top = 26
          Width = 96
          Height = 16
          Caption = #1086#1076#1091#1096#1077#1074#1083#1077#1085#1085#1086#1077
          TabOrder = 0
        end
        object cbTypeNumeral: TComboBox
          Left = 206
          Top = 24
          Width = 102
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1077#1085#1085#1086#1077
          Items.Strings = (
            #1082#1086#1083#1080#1095#1077#1089#1090#1074#1077#1085#1085#1086#1077
            #1087#1086#1088#1103#1076#1082#1086#1074#1086#1077)
        end
        object cbPadegNum: TComboBox
          Left = 46
          Top = 23
          Width = 154
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 153
        Width = 411
        Height = 55
        Caption = 'DeclCurrency'
        TabOrder = 5
        object Label14: TLabel
          Left = 3
          Top = 25
          Width = 38
          Height = 13
          Caption = #1042#1072#1083#1102#1090#1072
        end
        object lForms: TLabel
          Left = 248
          Top = 25
          Width = 78
          Height = 13
          Caption = #1060#1086#1088#1084#1072' '#1074#1099#1074#1086#1076#1072
        end
        object cbCurr: TComboBox
          Left = 46
          Top = 22
          Width = 196
          Height = 21
          TabOrder = 0
        end
        object seForms: TSpinEdit
          Left = 331
          Top = 21
          Width = 65
          Height = 22
          MaxValue = 3
          MinValue = 0
          TabOrder = 1
          Value = 1
        end
      end
      object bRandomNumber: TButton
        Left = 473
        Top = 2
        Width = 217
        Height = 24
        Caption = #1057#1083#1091#1095#1072#1081#1085#1086#1077' '#1095#1080#1089#1083#1086
        TabOrder = 6
        OnClick = bRandomNumberClick
      end
      object eNumber: TEdit
        Left = 85
        Top = 5
        Width = 334
        Height = 21
        TabOrder = 7
        Text = '1,12'
      end
    end
    object tsDict: TTabSheet
      Caption = #1057#1083#1086#1074#1072#1088#1080' '#1080' '#1089#1087#1088#1072#1074#1086#1095#1080#1085#1080#1082#1080
      ImageIndex = 2
      OnShow = tsDictShow
      object lblDict: TLabel
        Left = 0
        Top = 0
        Width = 109
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #1057#1083#1086#1074#1072#1088#1100' '#1085#1077' '#1079#1072#1075#1088#1091#1078#1077#1085
      end
      object lblNdbk: TLabel
        Left = 376
        Top = 0
        Width = 126
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1085#1077' '#1079#1072#1075#1088#1091#1078#1077#1085
      end
      object btnNewDict: TButton
        Left = 107
        Top = 31
        Width = 183
        Height = 20
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1083#1086#1074#1072#1088#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnNewDictClick
      end
      object btnLoadChanges: TButton
        Left = 107
        Top = 91
        Width = 183
        Height = 20
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1089#1083#1086#1074#1072#1088#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnLoadChangesClick
      end
      object btnOpenDict: TButton
        Left = 107
        Top = 148
        Width = 183
        Height = 20
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1083#1086#1074#1072#1088#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnOpenDictClick
      end
      object btnViewHdbk: TButton
        Left = 376
        Top = 31
        Width = 183
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1072#1083#1102#1090
        TabOrder = 3
        OnClick = btnViewHdbkClick
      end
      object Button1: TButton
        Left = 376
        Top = 91
        Width = 183
        Height = 20
        Caption = #1055#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1072' '#1073#1080#1073#1083#1080#1086#1090#1077#1082#1080
        TabOrder = 4
      end
    end
  end
  object pgcResult: TPageControl
    Left = 0
    Top = 252
    Width = 702
    Height = 219
    ActivePage = tsResult
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 698
    ExplicitHeight = 218
    object tsResult: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      DesignSize = (
        694
        191)
      object Label2: TLabel
        Left = 38
        Top = 38
        Width = 93
        Height = 13
        Caption = #1056' ('#1050#1086#1075#1086'/'#1095#1077#1075#1086' '#1085#1077#1090'?)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 26
        Top = 65
        Width = 105
        Height = 13
        Caption = #1044' ('#1050#1086#1084#1091'/'#1095#1077#1084#1091' '#1076#1072#1090#1100'?)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 35
        Top = 91
        Width = 95
        Height = 13
        Caption = #1042' ('#1050#1086#1075#1086'/'#1095#1090#1086' '#1074#1080#1078#1091'?)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 118
        Width = 112
        Height = 13
        Caption = #1058' ('#1050#1077#1084'/'#1095#1077#1084' '#1075#1086#1088#1078#1091#1089#1100'?)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 3
        Top = 145
        Width = 128
        Height = 13
        Caption = #1055' ('#1054' '#1082#1086#1084'/'#1086' '#1095#1077#1084' '#1084#1077#1095#1090#1072#1102'?)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 3
        Top = 163
        Width = 48
        Height = 13
        Caption = 'Unicode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit2: TEdit
        Left = 135
        Top = 35
        Width = 550
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 546
      end
      object Edit3: TEdit
        Left = 136
        Top = 63
        Width = 550
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 546
      end
      object Edit4: TEdit
        Left = 135
        Top = 89
        Width = 550
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        ExplicitWidth = 546
      end
      object Edit5: TEdit
        Left = 135
        Top = 115
        Width = 550
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        ExplicitWidth = 546
      end
      object Edit6: TEdit
        Left = 135
        Top = 142
        Width = 550
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        ExplicitWidth = 546
      end
      object btnClearResult: TButton
        Left = 532
        Top = 5
        Width = 143
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnClearResultClick
      end
      object btnNomin: TButton
        Left = 53
        Top = 7
        Width = 173
        Height = 25
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1080#1079
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnNominClick
      end
      object cbPadeg: TComboBox
        Left = 232
        Top = 8
        Width = 183
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 7
        Text = #1088#1086#1076#1080#1090#1077#1083#1100#1085#1086#1075#1086
        Items.Strings = (
          #1088#1086#1076#1080#1090#1077#1083#1100#1085#1086#1075#1086
          #1076#1072#1090#1077#1083#1100#1085#1086#1075#1086
          #1074#1080#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086
          #1090#1074#1086#1088#1080#1090#1077#1083#1100#1085#1086#1075#1086
          #1087#1088#1077#1076#1083#1086#1078#1085#1086#1075#1086)
      end
    end
    object tsLog: TTabSheet
      Caption = #1051#1086#1075
      ImageIndex = 1
      object mResult: TMemo
        Left = 0
        Top = 0
        Width = 694
        Height = 191
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        ParentFont = False
        TabOrder = 0
        OnChange = mResultChange
      end
    end
  end
  object dlgOpenFileDict: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1081' (*.dic)|*.dic|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 250
    Top = 380
  end
  object dlgOpenHdbk: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1080#1089#1082#1083#1102#1095#1077#1085#1080#1081' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 395
    Top = 378
  end
end
