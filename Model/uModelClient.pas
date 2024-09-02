unit uModelClient;

interface

type TModelClient = class
  private
    FName: string;
    FCep: Integer;
    FAddress: string;
    FComplement: string;
    FBairro: string;
    FLocation: string;
    FUf: string;

  public
  property Name: string read FName write FName;
  property Cep: Integer read FCep write FCep;
  property Address: string read FAddress write FAddress;
  property Complement: string read FComplement write FComplement;
  property Bairro: string read FBairro write FBairro;
  property Location: string read FLocation write FLocation;
  property Uf: string read FUf write FUf;
end;

implementation

end.
