object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'IP'#51452#49548#47196' '#51648#50669' '#52286#44592
  ClientHeight = 505
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbIPAddress: TLabel
    Left = 8
    Top = 19
    Width = 37
    Height = 15
    Caption = 'IP '#51452#49548
  end
  object eIPAddress: TEdit
    Left = 66
    Top = 16
    Width = 558
    Height = 23
    TabOrder = 0
  end
  object eMemo: TMemo
    Left = 8
    Top = 46
    Width = 697
    Height = 451
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btnExecute: TButton
    Left = 630
    Top = 15
    Width = 75
    Height = 25
    Caption = #51312#54924
    TabOrder = 2
    OnClick = btnExecuteClick
  end
end
