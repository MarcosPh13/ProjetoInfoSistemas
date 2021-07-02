object UCadastroCliente: TUCadastroCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 400
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pBackground: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      630
      400)
    object lTelefone: TLabel
      Left = 212
      Top = 56
      Width = 52
      Height = 13
      Caption = '*Telefone:'
    end
    object lCPF: TLabel
      Left = 116
      Top = 57
      Width = 29
      Height = 13
      Caption = '*CPF:'
    end
    object lEndereco: TLabel
      Left = 10
      Top = 115
      Width = 530
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Endere'#231'o'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 680
    end
    object Splitter1: TSplitter
      Left = 10
      Top = 135
      Width = 605
      Height = 3
      Align = alCustom
      Color = clMenuHighlight
      ParentColor = False
    end
    object lCEP: TLabel
      Left = 10
      Top = 144
      Width = 29
      Height = 13
      Caption = '*CEP:'
    end
    object eNome: TLabeledEdit
      Left = 10
      Top = 30
      Width = 605
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = '*Nome:'
      TabOrder = 0
    end
    object eTelefone: TMaskEdit
      Left = 212
      Top = 75
      Width = 93
      Height = 21
      EditMask = '(00)00000-0000;0;_'
      MaxLength = 14
      TabOrder = 3
      Text = ''
    end
    object eCPF: TMaskEdit
      Left = 116
      Top = 75
      Width = 88
      Height = 21
      EditMask = '000.000.000-00;0;_'
      MaxLength = 14
      TabOrder = 2
      Text = ''
    end
    object eIdentidade: TLabeledEdit
      Left = 10
      Top = 75
      Width = 100
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = '*Identidade (RG):'
      MaxLength = 13
      TabOrder = 1
    end
    object eEmail: TLabeledEdit
      Left = 315
      Top = 75
      Width = 300
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = '*E-mail:'
      TabOrder = 4
    end
    object bExit: TButton
      Left = 10
      Top = 364
      Width = 100
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 14
      OnClick = bExitClick
    end
    object eLogradouro: TLabeledEdit
      Left = 10
      Top = 205
      Width = 495
      Height = 21
      TabStop = False
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = 'Logradouro:'
      Enabled = False
      ReadOnly = True
      TabOrder = 7
    end
    object eNumero: TLabeledEdit
      Left = 515
      Top = 205
      Width = 100
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero:'
      NumbersOnly = True
      TabOrder = 8
    end
    object ePais: TLabeledEdit
      Left = 515
      Top = 250
      Width = 100
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'Pa'#237's:'
      TabOrder = 13
    end
    object eEstado: TLabeledEdit
      Left = 455
      Top = 250
      Width = 50
      Height = 21
      TabStop = False
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Estado:'
      Enabled = False
      ReadOnly = True
      TabOrder = 12
    end
    object eCidade: TLabeledEdit
      Left = 322
      Top = 250
      Width = 121
      Height = 21
      TabStop = False
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade:'
      Enabled = False
      ReadOnly = True
      TabOrder = 11
    end
    object eBairro: TLabeledEdit
      Left = 10
      Top = 250
      Width = 150
      Height = 21
      TabStop = False
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Bairro:'
      Enabled = False
      ReadOnly = True
      TabOrder = 9
    end
    object eComplemento: TLabeledEdit
      Left = 166
      Top = 250
      Width = 150
      Height = 21
      TabStop = False
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento:'
      Enabled = False
      ReadOnly = True
      TabOrder = 10
    end
    object eCEP: TMaskEdit
      Left = 10
      Top = 163
      Width = 114
      Height = 21
      EditMask = '00000-000;0;_'
      MaxLength = 9
      TabOrder = 5
      Text = ''
    end
    object bValidCEP: TButton
      Left = 130
      Top = 161
      Width = 100
      Height = 25
      Caption = 'Validar CEP'
      TabOrder = 6
      OnClick = bValidCEPClick
    end
    object bSave: TButton
      Left = 515
      Top = 364
      Width = 100
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 15
      OnClick = bSaveClick
    end
  end
end
