unit UAAPIviacep;

interface
  uses
    System.SysUtils, System.Classes, System.json, IdTCPConnection, IdTCPClient,
    IdHTTP, IdSSLOpenSSL;

type
  TAPIViacep = class
    RespCode: Integer;
    Logradouro, Complemento, Bairro, Localidade, UF, IBGE, Gia, Unidade : String;
    procedure BuscarCep(pCep: String);
    procedure LerJson(pJson: String);
    function GetRespCode: Integer;
    function GetLogradouro : String;
    function GetComplemento : String;
    function GetBairro : String;
    function GetLocalidade : String;
    function GetUF : String;
    function GetIBGE : String;
    function GetGia : String;
    function GetUnidade : String;
    constructor Create(pCEP : String);
  end;
implementation
{ TAPIwebm }
procedure TAPIViacep.BuscarCep(pCEP: String);
var
  IdHTTP: TIdHTTP;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
begin
  IdHTTP := TIdHTTP.Create(nil);
  LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  LHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  IdHTTP.IOHandler := LHandler;
  Response := TStringStream.Create;

  try
    try
      IdHTTP.Get('https://viacep.com.br/ws/' + pCEP + '/json/', Response);
      RespCode := IdHTTP.ResponseCode;
    except
      RespCode := IdHTTP.ResponseCode;
      exit;
    end;
  finally
    FreeAndNil(IdHTTP);
    FreeAndNil(LHandler);
    FreeAndNil(Response);
  end;
  LerJson(Response.DataString);
end;

constructor TAPIViacep.Create(pCEP: String);
begin
   BuscarCep(pCEP);
end;

function TAPIViacep.GetBairro: String;
begin
  Result := Bairro;
end;

function TAPIViacep.GetComplemento: String;
begin
  Result := Complemento;
end;

function TAPIViacep.GetGia: String;
begin
  Result := Gia;
end;

function TAPIViacep.GetIBGE: String;
begin
  Result := IBGE;
end;

function TAPIViacep.GetLocalidade: String;
begin
  Result := Localidade;
end;

function TAPIViacep.GetLogradouro: String;
begin
  Result := Logradouro;
end;

function TAPIViacep.GetRespCode: Integer;
begin
  Result := RespCode;
end;

function TAPIViacep.GetUF: String;
begin
  Result := UF;
end;

function TAPIViacep.GetUnidade: String;
begin
  Result := Unidade;
end;

procedure TAPIViacep.LerJson(pJson: String);
var
  umJSONObject : TJSONObject;
begin
  try
    umJSONObject:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(pJson), 0) as TJSONObject;
    Logradouro  := umJSONObject.Get('logradouro').JsonValue.Value;
    Bairro      := umJSONObject.Get('bairro').JsonValue.Value;
    Localidade  := umJSONObject.Get('localidade').JsonValue.Value;
    Complemento := umJSONObject.Get('complemento').JsonValue.Value;
    Unidade     := umJSONObject.Get('unidade').JsonValue.Value;
    IBGE        := umJSONObject.Get('ibge').JsonValue.Value;
    UF          := umJSONObject.Get('uf').JsonValue.Value;
    Gia         := umJSONObject.Get('gia').JsonValue.Value;
  finally
    FreeAndNil(umJSONObject);
  end;
end;

end.
