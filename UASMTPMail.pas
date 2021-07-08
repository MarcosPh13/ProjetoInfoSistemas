unit UASMTPMail;

interface
  uses System.SysUtils, Vcl.Dialogs, IdSMTP, IdMessage, IdAttachment,
       IdAttachmentFile, IdSSLOpenSSL, IdExplicitTLSClientServerBase;
type
  newMail = class
	  messageRecipient: string;
	  messageCC: string;
	  messageSubject: string;
	  messageFromAdress: string;
	  messageBodyAdd: string;
	  messageAttachment: string;
	  function sendEmail(): Boolean;
  end;

implementation

function newMail.sendEmail: Boolean;
var
SMTPCon: TIdSMTP;
SMTPMsg: TIdMessage;
SMTPIOHandler: TIdSSLIOHandlerSocketOpenSSL;
SMTPAttachment: TIdAttachment;
begin
  SMTPCon       := TIdSMTP.Create();
  SMTPMsg       := TIdMessage.Create();
  SMTPIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create();

  SMTPCon.Host      := 'smtp.live.com';
  SMTPCon.Port      := 587;
  SMTPCon.Username  := 'marcos.p.cruz@hotmail.com';
  SMTPCon.Password  := '';//Valor não informado por segurança.
  SMTPCon.IOHandler := SMTPIOHandler;
  SMTPCon.UseTLS    := utUseExplicitTLS;
  with SMTPIOHandler do
	begin
	  Destination            := 'smtp.live.com';
	  Host                   := 'smtp.live.com';
	  Port                   := 587;
	  SSLOptions.Method      := sslvTLSv1;
	  SSLOptions.Mode        := sslmUnassigned;
	  SSLOptions.VerifyMode  := [];
	  SSLOptions.VerifyDepth := 0;
	end;

  SMTPMsg.Recipients.EmailAddresses := messageRecipient;
  if (messageCC <> '') then
    SMTPMsg.Bcclist.EmailAddresses := messageCC;
  SMTPMsg.Subject      := messageSubject;
  SMTPMsg.From.Address := messageFromAdress;
  SMTPMsg.Body.Add(messageBodyAdd);
  if FileExists(messageAttachment) then
    SMTPAttachment := TIdAttachmentFile.Create(SMTPMsg.MessageParts, messageAttachment);

  try
    try
      SMTPCon.Connect();
	    SMTPCon.Send(SMTPMsg);
	    SMTPCon.Disconnect();
	    SMTPMsg.Clear;
	    showMessage('E-mail enviado com sucesso para '+ messageRecipient);
  	  Result := True;
    except
      showMessage('Houve um problema ao enviar o email.');
      Result := False;
    end;
  finally
    SMTPCon.Free;
    SMTPIOHandler.Free;
  end;
end;

end.
