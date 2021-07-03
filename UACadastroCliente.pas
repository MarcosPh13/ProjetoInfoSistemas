unit UACadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Datasnap.DBClient, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP;

type
  TUCadastroCliente = class(TForm)
    pBackground: TPanel;
    eNome: TLabeledEdit;
    eTelefone: TMaskEdit;
    lTelefone: TLabel;
    eCPF: TMaskEdit;
    lCPF: TLabel;
    eIdentidade: TLabeledEdit;
    eEmail: TLabeledEdit;
    bExit: TButton;
    lEndereco: TLabel;
    Splitter1: TSplitter;
    eLogradouro: TLabeledEdit;
    eNumero: TLabeledEdit;
    ePais: TLabeledEdit;
    eEstado: TLabeledEdit;
    eCidade: TLabeledEdit;
    eBairro: TLabeledEdit;
    eComplemento: TLabeledEdit;
    eCEP: TMaskEdit;
    bValidCEP: TButton;
    bSave: TButton;
    lCEP: TLabel;
    dsDados: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosNOME: TStringField;
    cdsDadosIDENTIDADE: TStringField;
    cdsDadosCPF: TStringField;
    cdsDadosTELEFONE: TStringField;
    cdsDadosEMAIL: TStringField;
    cdsDadosCEP: TStringField;
    cdsDadosLOGRADOURO: TStringField;
    cdsDadosNUMERO: TStringField;
    cdsDadosBAIRRO: TStringField;
    cdsDadosCOMPLEMENTO: TStringField;
    cdsDadosCIDADE: TStringField;
    cdsDadosESTADO: TStringField;
    cdsDadosPAIS: TStringField;
    NMSTP1: TIdSMTP;
    eEmailEnv: TLabeledEdit;
    procedure bExitClick(Sender: TObject);
    procedure bValidCEPClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UCadastroCliente: TUCadastroCliente;

implementation

{$R *.dfm}

uses UnAPIviacep;

procedure TUCadastroCliente.bExitClick(Sender: TObject);
begin
  Close;
end;

procedure TUCadastroCliente.bSaveClick(Sender: TObject);
begin
  if (eNome.Text = '') then
  begin
    showMessage('O campo "'+ eNome.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eNome.SetFocus;
    Abort;
  end;
  if (eIdentidade.Text = '') then
  begin
    showMessage('O campo "'+ eIdentidade.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eIdentidade.SetFocus;
    Abort;
  end;
  if (eCPF.Text = '') then
  begin
    showMessage('O campo "'+ lCPF.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCPF.SetFocus;
    Abort;
  end;
  if (eTelefone.Text = '') then
  begin
    showMessage('O campo "'+ lTelefone.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eTelefone.SetFocus;
    Abort;
  end;
  if (eEmail.Text = '') then
  begin
    showMessage('O campo "'+ eEmail.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eEmail.SetFocus;
    Abort;
  end;
  if (eCEP.Text = '') then
  begin
    showMessage('O campo "'+ lCEP.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (eLogradouro.Text = '') then
  begin
    showMessage('O campo "'+ eLogradouro.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (eNumero.Text = '') then
  begin
    showMessage('O campo "'+ eNumero.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (eBairro.Text = '') then
  begin
    showMessage('O campo "'+ eBairro.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (eCidade.Text = '') then
  begin
    showMessage('O campo "'+ eCidade.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (eEstado.Text = '') then
  begin
    showMessage('O campo "'+ eEstado.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (ePais.Text = '') then
  begin
    showMessage('O campo "'+ ePais.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    ePais.SetFocus;
    Abort;
  end;
  if (eEmailEnv.Text = '') then
  begin
    ShowMessage('O campo "'+ eEmailEnv.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eEmailEnv.SetFocus;
    Abort;
  end;

  try
    if (not cdsDados.Active) then
    begin
      cdsDados.CreateDataSet;
      cdsDados.EmptyDataSet;
      cdsDados.Active := True;
    end;

    cdsDados.Insert;
    cdsDadosNOME.Value        := eNome.Text;
    cdsDadosIDENTIDADE.Value  := eIdentidade.Text;
    cdsDadosCPF.Value         := eCPF.Text;
    cdsDadosTELEFONE.Value    := eTelefone.Text;
    cdsDadosEMAIL.Value       := eEmail.Text;
    cdsDadosCEP.Value         := eCEP.Text;
    cdsDadosLOGRADOURO.Value  := eLogradouro.Text;
    cdsDadosNUMERO.Value      := eNumero.Text;
    cdsDadosBAIRRO.Value      := eBairro.Text;
    cdsDadosCOMPLEMENTO.Value := eComplemento.Text;
    cdsDadosCIDADE.Value      := eCidade.Text;
    cdsDadosESTADO.Value      := eEstado.Text;
    cdsDadosPAIS.Value        := ePais.Text;
    cdsDados.Post;

    showMessage('XML Criado com suscesso!');
  finally

  end;

  {NMSTP1.Host := 'smtp.outlook.com';
  NMSTP1.Port := 25;
  NMSTP1.Username := eEmailEnv.Text;
  NMSTP1.Connect;

  if (not NMSTP1.Connected) then
  begin
    raise Exception.Create('Erro de Conexão');

  end;

  NMSTP1.Disconnect(True);}
  Close;
end;

procedure TUCadastroCliente.bValidCEPClick(Sender: TObject);
var
   UmAPIviacep : TAPIviacep;
begin
  try
      UmAPIviacep := TAPIviacep.Create(eCEP.Text);
      //se encontrou o CEP, preenche os TEdits do form
      if (UmAPIviacep.GetRespCode = 200 ) then
      begin
        eLogradouro.Text  := UmAPIviacep.GetLogradouro;
        eBairro.Text      := UmAPIviacep.GetBairro;
        eComplemento.Text := UmAPIviacep.GetComplemento;
        eCidade.Text      := UmAPIviacep.GetLocalidade;
        eEstado.Text      := UmAPIviacep.GetUF;
      end
      else if (UmAPIviacep.GetRespCode = 400) then
        showMessage('CEP inválido ou não encontrado');
   finally
     FreeAndNil(UmAPIviacep);
   end;
end;

end.
