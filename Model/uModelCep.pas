unit uModelCep;

interface

uses  System.Classes;

type
  TModelCep = class
  private
    FLogradouro: string;
    FComplemento: string;
    FUnidade: string;
    FBairro: string;
    FLocalidade:  string;
    FUf: string;
  public
    property Logradouro: string read FLogradouro write FLogradouro;
    property Complemento: string read FComplemento write FComplemento;
    property Unidade: string read FUnidade write FUnidade;
    property Bairro: string read FBairro write FBairro;
    property Localidade: string  read FLocalidade write FLocalidade;
    property Uf: string read FUf write FUf;

   end;

implementation
{ TModelCep }

end.
