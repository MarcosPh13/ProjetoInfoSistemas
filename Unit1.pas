unit Unit1;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  ProjetoInfoSistemas = class(TObject) 
  public
  end;

implementation


initialization
  TDUnitX.RegisterTestFixture(ProjetoInfoSistemas);
end.
