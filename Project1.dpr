program Project1;

uses
  Vcl.Forms,
  UACadastroCliente in 'UACadastroCliente.pas' {UCadastroCliente},
  UnAPIviacep in 'UnAPIviacep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUCadastroCliente, UCadastroCliente);
  Application.Run;
end.
