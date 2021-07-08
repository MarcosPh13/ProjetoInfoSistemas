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
      Width = 89
      Height = 21
      EditMask = '(99)99999-9999;0;_'
      MaxLength = 14
      TabOrder = 3
      Text = ''
    end
    object eCPF: TMaskEdit
      Left = 116
      Top = 76
      Width = 86
      Height = 21
      EditMask = '999.999.999-99;0;_'
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
      TabOrder = 16
      OnClick = bExitClick
    end
    object eLogradouro: TLabeledEdit
      Left = 10
      Top = 205
      Width = 495
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = '*Logradouro:'
      TabOrder = 7
    end
    object eNumero: TLabeledEdit
      Left = 515
      Top = 205
      Width = 100
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = '*N'#250'mero:'
      NumbersOnly = True
      TabOrder = 8
    end
    object ePais: TLabeledEdit
      Left = 515
      Top = 250
      Width = 100
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = '*Pa'#237's:'
      TabOrder = 13
    end
    object eEstado: TLabeledEdit
      Left = 459
      Top = 250
      Width = 50
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = '*Estado:'
      MaxLength = 2
      TabOrder = 12
    end
    object eCidade: TLabeledEdit
      Left = 322
      Top = 250
      Width = 131
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = '*Cidade:'
      TabOrder = 11
    end
    object eBairro: TLabeledEdit
      Left = 10
      Top = 250
      Width = 150
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = '*Bairro:'
      TabOrder = 9
    end
    object eComplemento: TLabeledEdit
      Left = 166
      Top = 250
      Width = 150
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = 'Complemento:'
      TabOrder = 10
    end
    object eCEP: TMaskEdit
      Left = 10
      Top = 163
      Width = 112
      Height = 21
      EditMask = '99999-999;0;_'
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
    object eEmailEnv: TLabeledEdit
      Left = 10
      Top = 294
      Width = 605
      Height = 21
      EditLabel.Width = 82
      EditLabel.Height = 13
      EditLabel.Caption = '*E-mail de Envio:'
      TabOrder = 14
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 400
    Top = 320
  end
  object cdsDados: TClientDataSet
    PersistDataPacket.Data = {
      7D0100009619E0BD01000000180000000D0000000000030000007D01044E4F4D
      4501004900000001000557494454480200020064000A4944454E544944414445
      0100490000000100055749445448020002001400034350460100490000000100
      0557494454480200020014000854454C45464F4E450100490000000100055749
      44544802000200140005454D41494C0100490000000100055749445448020002
      0064000343455001004900000001000557494454480200020014000A4C4F4752
      41444F55524F010049000000010005574944544802000200C800064E554D4552
      4F01004900000001000557494454480200020014000642414952524F01004900
      000001000557494454480200020064000B434F4D504C454D454E544F01004900
      0000010005574944544802000200640006434944414445010049000000010005
      57494454480200020064000645535441444F0100490000000100055749445448
      0200020014000450414953010049000000010005574944544802000200640000
      00}
    Active = True
    Aggregates = <>
    FileName = 'CadastroClientes.xml'
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COMPLEMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 320
    object cdsDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsDadosIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsDadosCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsDadosTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object cdsDadosEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsDadosCEP: TStringField
      FieldName = 'CEP'
    end
    object cdsDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsDadosNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsDadosESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object cdsDadosPAIS: TStringField
      FieldName = 'PAIS'
      Size = 100
    end
  end
end
