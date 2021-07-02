unit UACadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls;

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
  if (eNumero.Text = '') then
  begin
    showMessage('O campo "'+ eNumero.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    eCEP.SetFocus;
    Abort;
  end;
  if (ePais.Text = '') then
  begin
    showMessage('O campo "'+ ePais.EditLabel.Caption +'" é obrigatório.'#13'Favor informar um valor.');
    ePais.SetFocus;
    Abort;
  end;
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
