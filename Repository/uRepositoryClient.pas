unit uRepositoryClient;

interface
uses uModelClient, Data.DB, Data.Win.ADODB,System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.Phys.FB, FireDAC.Comp.DataSet, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DApt, FireDAC.FMXUI.Wait, Data.SqlExpr,udmModule;

type TRepositoryClient = class
  private
    procedure InsertDatabaseFirebird(pClient: TModelClient);
    procedure InsertDatabaseSQLServer(pClient: TModelClient);
    procedure  InsertDataBaseOracle(pClient: TModelClient);
    procedure InsertDataBasePostGres(pClient: TModelClient);

  public
    procedure SaveClient(pClient: TModelClient; pDatabase: Integer);
end;

implementation

{ TRepositoryClient }

procedure TRepositoryClient.InsertDatabaseFirebird(pClient: TModelClient);
var
  FDConnection: TFDConnection;
  FDQuery: TFDQuery;
begin
  FDConnection := TFDConnection.Create(nil);
  FDQuery := TFDQuery.Create(nil);
  try
    FDConnection.DriverName := 'FB';
    FDConnection.Params.Add('Database=D:\Projetos\Delphi-Varios-Bancos\banco\DATABASE.FDB');
    FDConnection.Params.Add('User_Name=SYSDBA');
    FDConnection.Params.Add('Password=masterkey');
    FDConnection.Params.Add('Server=localhost');
    FDConnection.Params.Add('Charset=WIN1252');
    FDConnection.LoginPrompt := False;
    FDConnection.Connected := True;
    FDConnection.Params.Add('Port=3050');
    FDConnection.LoginPrompt := False;
    FDConnection.Connected := True;


    FDQuery.Connection :=   FDConnection;
    FDQuery.SQL.Add('INSERT INTO cliente (ID,NOME, ENDERECO, BAIRRO, CIDADE, UF, CEP) VALUES (:id, :name, :endereco, :bairro, :cidade, :uf, :cep)');

    FDQuery.ParamByName('id').AsInteger := 1;

    FDQuery.Params.ParamByName('name').AsString := pClient.Name;
    FDQuery.ParamByName('endereco').AsString := pClient.Address;
    FDQuery.ParamByName('bairro').AsString := pClient.Bairro;
    FDQuery.ParamByName('cidade').AsString := pClient.Location;
    FDQuery.ParamByName('uf').AsString := pClient.Uf;
    FDQuery.ParamByName('cep').AsInteger := pClient.Cep;
    // Executar a inserção
    FDQuery.ExecSQL;

  except
    on E: Exception do
      Writeln('Erro ao inserir dados: ' + E.Message);
  END;

end;
procedure TRepositoryClient.InsertDataBaseOracle(pClient: TModelClient);
var
  sqlServer: TADOQuery;
    connectionDatabase: TADOConnection;
begin
  sqlServer := TADOQuery.Create(nil);
    connectionDatabase := TADOConnection.Create(Nil);
  try
    connectionDatabase.ConnectionString := '';
    connectionDatabase.LoginPrompt := false;

   sqlServer.Connection :=  connectionDatabase;
   connectionDatabase.Open;
   sqlServer.SQL.Add('INSERT INTO cliente(NOME, ENDERECO, ' +
                     'BAIRRO, CIDADE, UF, CEP)VALUES(:name, :endereco, '+
                     ':bairro, :cidade, :uf, :cep)');
   sqlServer.Parameters.ParamByName('name').Value :=  pClient.Name;
   sqlServer.Parameters.ParamByName('endereco').Value := pClient.Address;
   sqlServer.Parameters.ParamByName('bairro').Value := pClient.Bairro;
   sqlServer.Parameters.ParamByName('cidade').Value :=  pClient.Location;
   sqlServer.Parameters.ParamByName('uf').Value := pClient.Uf;
   sqlServer.Parameters.ParamByName('cep').Value := pclient.Cep;

   sqlServer.ExecSQL;
  finally
   sqlServer.Free;
  end;


end;

procedure TRepositoryClient.InsertDataBasePostGres(pClient: TModelClient);
begin
  dmModule.QryDados.close;
  dmModule.QryDados.SQL.Clear;
  dmModule.QryDados.SQL.Add('INSERT INTO public.cliente (   ');
  dmModule.QryDados.SQL.Add('"NOME", ');
  dmModule.QryDados.SQL.Add('"ENDERECO",');
  dmModule.QryDados.SQL.Add('"BAIRRO",');
  dmModule.QryDados.SQL.Add('"CIDADE",');
  dmModule.QryDados.SQL.Add('"UF",');
  dmModule.QryDados.SQL.Add('"CEP"');
  dmModule.QryDados.SQL.Add(') VALUES (');
   dmModule.QryDados.SQL.Add(':NOME, ');
  dmModule.QryDados.SQL.Add(':ENDERECO,');
  dmModule.QryDados.SQL.Add(':BAIRRO,');
  dmModule.QryDados.SQL.Add(':CIDADE,');
  dmModule.QryDados.SQL.Add(':UF,');
  dmModule.QryDados.SQL.Add(':CEP');
  dmModule.QryDados.SQL.Add(')');

   dmModule.QryDados.ParamByName('NOME').AsString  := pClient.Name;
  dmModule.QryDados.ParamByName('ENDERECO').asstring := pClient.Address;
  dmModule.QryDados.ParamByName('BAIRRO').AsString := pClient.Bairro;
  dmModule.QryDados.ParamByName('CIDADE').AsString := pClient.Location;
  dmModule.QryDados.ParamByName('UF').AsString := pClient.Uf;
  dmModule.QryDados.ParamByName('CEP').AsInteger := pClient.Cep;
  dmModule.QryDados.ExecSQL;
end;

procedure TRepositoryClient.InsertDatabaseSQLServer(pClient: TModelClient);
var
  sqlServer: TADOQuery;
    connectionDatabase: TADOConnection;
begin
  sqlServer := TADOQuery.Create(nil);
    connectionDatabase := TADOConnection.Create(Nil);
  try
    connectionDatabase.ConnectionString := '';
    connectionDatabase.LoginPrompt := false;

   sqlServer.Connection :=  connectionDatabase;
   connectionDatabase.Open;
   sqlServer.SQL.Add('INSERT INTO TESTESISTEMA.dbo.cliente(NOME, ENDERECO, ' +
                     'BAIRRO, CIDADE, UF, CEP)VALUES(:name, :endereco, '+
                     ':bairro, :cidade, :uf, :cep)');
   sqlServer.Parameters.ParamByName('name').Value :=  pClient.Name;
   sqlServer.Parameters.ParamByName('endereco').Value := pClient.Address;
   sqlServer.Parameters.ParamByName('bairro').Value := pClient.Bairro;
   sqlServer.Parameters.ParamByName('cidade').Value :=  pClient.Location;
   sqlServer.Parameters.ParamByName('uf').Value := pClient.Uf;
   sqlServer.Parameters.ParamByName('cep').Value := pclient.Cep;
    sqlServer.SQL.Add('SELECT 1 ');
   sqlServer.Open;
  finally
   sqlServer.Free;
  end;

end;

procedure TRepositoryClient.SaveClient(pClient: TModelClient;
  pDatabase: Integer);
begin
 if pDatabase = 0 then
 begin
  InsertDataBaseOracle(pClient);
 end
 else if pDatabase = 1 then
 begin
   InsertDatabaseFirebird(pClient);
 end
 else if pDatabase = 2 then
 begin
  InsertDatabaseSQLServer(pClient);
 end
 else if pDatabase = 3 then
 begin
   InsertDataBasePostGres(pClient);
 end;

end;

end.

