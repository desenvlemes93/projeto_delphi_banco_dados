object uFormPrincipal: TuFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadasto de Cliente'
  ClientHeight = 367
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblCode: TLabel
    Left = 3
    Top = 22
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object lblName: TLabel
    Left = 3
    Top = 72
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lblCep: TLabel
    Left = 3
    Top = 122
    Width = 24
    Height = 15
    Caption = 'Cep:'
  end
  object Label1: TLabel
    Left = 3
    Top = 172
    Width = 49
    Height = 15
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 186
    Top = 173
    Width = 77
    Height = 15
    Caption = 'Complemento'
  end
  object Label3: TLabel
    Left = 374
    Top = 172
    Width = 31
    Height = 15
    Caption = 'Bairro'
  end
  object Label4: TLabel
    Left = 8
    Top = 222
    Width = 57
    Height = 15
    Caption = 'Localidade'
  end
  object lblUf: TLabel
    Left = 191
    Top = 222
    Width = 35
    Height = 15
    Caption = 'Estado'
  end
  object edtName: TEdit
    Left = 3
    Top = 43
    Width = 39
    Height = 23
    Enabled = False
    TabOrder = 0
  end
  object edtName2: TEdit
    Left = 3
    Top = 93
    Width = 326
    Height = 23
    TabOrder = 1
  end
  object maskCep: TMaskEdit
    Left = 3
    Top = 143
    Width = 121
    Height = 23
    TabOrder = 2
    Text = ''
  end
  object btnSearch: TButton
    Left = 130
    Top = 142
    Width = 75
    Height = 25
    Caption = 'Buscar Cep'
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object edtAdress: TEdit
    Left = 3
    Top = 193
    Width = 177
    Height = 23
    TabOrder = 4
  end
  object edtComplemento: TEdit
    Left = 186
    Top = 193
    Width = 177
    Height = 23
    TabOrder = 5
  end
  object edtBairro: TEdit
    Left = 369
    Top = 193
    Width = 99
    Height = 23
    TabOrder = 6
  end
  object edtLocalidade: TEdit
    Left = 8
    Top = 243
    Width = 177
    Height = 23
    TabOrder = 7
  end
  object edtUf: TEdit
    Left = 191
    Top = 243
    Width = 58
    Height = 23
    TabOrder = 8
  end
  object Button1: TButton
    Left = 3
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 9
    OnClick = Button1Click
  end
  object RgDataBase: TRadioGroup
    Left = 352
    Top = 8
    Width = 185
    Height = 105
    Caption = 'Banco de dados'
    Items.Strings = (
      'Oracle'
      'Firebird'
      'SQL Server')
    TabOrder = 10
  end
end