unit classSMTPMail;

interface
  uses Dialogs, SysUtils, Variants, MyAccess, dateUtils, IdMessage, IdBaseComponet,
	   ifComponent, IdTCPConnection, iDTCPClient, IdExplicitTLSCClientServerBase,
	   IdMessageClient, IdSMTPBase, IdSMTP, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
	   IdAttachment, IdMessageParts, IdEmailAdress, IdAttachmentFile, Forms;
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
	
Implementation

uses Modulo_dados, login_Form;

function newMail.sendEmail: Boolean;
var
SMTPCon: TIdSMTP;
SMTPMsg: TIdMessage;
SMTPIOHandler: TIdSSLIOHandlerSocketOpenSSL;
SMTPAttachment: TIdAttachment;
begin
  SMTPCon := TIdSMTP.Create();
  SMTPMsg := TIdMessage.Create();
  SMTPIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create();
  ModuloDados.sql_SmtpSettings.Open;
  ModuloDados.sql_SmtpSettings.ParamByName('xCampus').AsInteger := nCampus;
  ModuloDados.sql_SmtpSettings.Execute;
	
  SMTPCon.Host := ModuloDados.sql_SmtpSettings_host.AsString;
  SMTPCon.Port := ModuloDados.sql_SmtpSettings_port.AsInteger;
  SMTPCon.Username := ModuloDados.sql_SmtpSettings_username.AsString;
  SMTPCon.Password := ModuloDados.sql_SmtpSettings_password.AsString;
  SMTPCon.IOHandler := SMTPIOHandler;
  SMTPCon.UseTLS: utUseExplicitTLS;
  with SMTPIOHandler do
	begin
	  Destination := ModuloDados.sql_SmtpSettings_host.AsString;
	  Host := ModuloDados.sql_SmtpSettings_host.AsString;
	  Port := ModuloDados.sql_SmtpSettings_port.AsInteger;
	  SSLOption.Method := sslvTLSv1;
	  SSLOption.Mode := sslmUnassigned;
	  SSLOption.VerifyMode := [];
	  SSLOption.VerifyDepth := 0;
	end;
  
  SMTPMsg.Recipients.EamilAddresses := messageRecipient;
  if (messageCC <> '') then SMTP.Bcclist.EmailAddresses := messageCC;
  SMTPMsg.Subject := messageSubject;
  SMTPMsg.From.Address := messageFromAdress;
  SMTPMsg.Body.Add(messageBodyAdd);
  
  if FileExists(messageAttachment) then SMTPAttachment := TIdAttachmentFile.Create(SMTPMsg.MessageParts, messageAttachment);
  
  try
    SMTPCon.Connect();
	SMTPCon.Send(SMTPMsg);
	SMTPCon.Disconnect();
	SMTPMsg.Clear;
	ModuloDados.sql_SmtpSettings.Close;
	showMessage('E-mail sent Successfully to '+ messageRecipient);
	SMTPCon.Free;
	SMTPIOHandler.Free;
	Result := True;
  except
    showMessage('Error Sending E-mail.'#13'Contact the Administrator.');
	ModuloDados.sql_SmtpSettings.Close;
	SMTPCon.Free;
	SMTPIOHandler.Free;
	Result := False;
  end;
end;
end;

{var
   xsendMail: newMail;
 begin
   xsendMail := newMail.Create();
   xsendMail := messageRecipient := editTo.Text;
   xsendMail := messageSubject := editSubjetc.Text;
   xsendMail := messageFromAdress := editFrom.Text;
   xsendMail := messageBodyAdd := editContent.Text;
   xsendMail := messageAttachment := editAttachmentFile.Text;
   if (xsendMail.sendEmail()) then
   begin
     xsendMail.Destroy;
   end;
 end;}