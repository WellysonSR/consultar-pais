object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 351
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblConsultaPais: TLabel
    Left = 88
    Top = 91
    Width = 75
    Height = 15
    Caption = 'Consultar Pa'#237's'
  end
  object edtPesquisa: TEdit
    Left = 64
    Top = 128
    Width = 129
    Height = 23
    TabOrder = 0
  end
  object btnConsultarPais: TButton
    Left = 64
    Top = 176
    Width = 129
    Height = 25
    Caption = 'Consultar Pa'#237's'
    TabOrder = 1
    OnClick = btnConsultarPaisClick
  end
  object memoResultados: TMemo
    Left = 240
    Top = 88
    Width = 201
    Height = 177
    Lines.Strings = (
      'memoResultados')
    TabOrder = 2
  end
end
