unit uServiceClient;

interface
uses uRepositoryClient, uModelClient;

type TServiceClient = class
  private

  public
  class  procedure InsertRegisterDatabse(pClient: TModelClient; pNumber: Integer);

end;

implementation

{ TServiceClient }

class procedure TServiceClient.InsertRegisterDatabse(pClient: TModelClient;
  pNumber: Integer);
var
  repositoryClient : TRepositoryClient;
begin
  repositoryClient := TRepositoryClient.Create;
  try
   repositoryClient.SaveClient(pClient,pNumber);
  finally
    repositoryClient.Free;
  end;


end;

end.
