unit uRepository.Cep;

interface
uses
  uModelCep,  System.Json,
  REST.Client,
  REST.HttpClient,
  Rest.Types,Winapi.Messages, System.SysUtils, System.Variants, System.Classes;

type

  TRepositoryCep = class
    public
      function ListCep(pNumber: Integer): TModelCep;
    private
  end;
implementation

{ TRepositoryCep }

function TRepositoryCep.ListCep(pNumber: Integer): TModelCep;
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  modelCep:  TModelCep;
  JSONValue: TJSONValue;
begin
  restClient := TRESTClient.Create(Nil);
  restRequest := TRESTRequest.Create(Nil);
  restResponse := TRESTResponse.Create(Nil);
  modelCep :=  TModelCep.Create;

   try
      restClient.BaseURL :='https://viacep.com.br/ws/'+pNumber.ToString+'/json/';
      restRequest.Client := restClient;
      restRequest.Response := restResponse;
      restRequest.Method := TRESTRequestMethod.rmGET;
      restRequest.Execute;
     if restResponse.StatusCode = 200 then
     begin
       JSONValue := TJSONObject.ParseJSONValue(RESTResponse.Content);
       modelCep.Logradouro := JSONValue.GetValue<string>('logradouro');
       modelCep.Complemento := JSONValue.GetValue<string>('complemento');
       modelCep.Unidade := JSONValue.GetValue<string>('unidade');
       modelCep.Bairro := JSONValue.GetValue<string>('bairro');
       modelCep.Localidade := JSONValue.GetValue<string>('localidade');
       modelCep.Uf := JSONValue.GetValue<string>('uf');

       result := modelCep;
     end;
   finally
   end;
end;

end.
