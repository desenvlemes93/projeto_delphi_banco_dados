unit uServiceCep;

interface
uses  uModelCep,uRepository.Cep;

type
  TServiceCep = class
    private

    public
     class function ListCep(pNumber: Integer): TModelCep;

  end;

implementation

{ TServiceCep }

class function TServiceCep.ListCep(pNumber: Integer): TModelCep;
var
  repositoryCep: TRepositoryCep;
begin
  repositoryCep := TRepositoryCep.Create;
  try
    Result := repositoryCep.ListCep (pNumber);


  finally
    repositoryCep.Free;
  end;

end;

end.
