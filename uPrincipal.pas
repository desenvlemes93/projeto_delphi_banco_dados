unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, uModelCep, uServiceCep,
  Data.DB, Data.Win.ADODB, uServiceClient, uModelClient, Data.DBXMySQL,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.SqlExpr,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase;

type
  TuFormPrincipal = class(TForm)
    lblCode: TLabel;
    edtName: TEdit;
    lblName: TLabel;
    edtName2: TEdit;
    lblCep: TLabel;
    maskCep: TMaskEdit;
    btnSearch: TButton;
    edtAdress: TEdit;
    Label1: TLabel;
    edtComplemento: TEdit;
    Label2: TLabel;
    edtBairro: TEdit;
    Label3: TLabel;
    edtLocalidade: TEdit;
    Label4: TLabel;
    edtUf: TEdit;
    lblUf: TLabel;
    Button1: TButton;
    RgDataBase: TRadioGroup;
    procedure btnSearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uFormPrincipal: TuFormPrincipal;

implementation

{$R *.dfm}


procedure TuFormPrincipal.btnSearchClick(Sender: TObject);
var
  modelCep: TModelCep;
  serviceCep: TServiceCep;
begin
  modelCep := TModelCep.Create;

  try
   modelCep := TServiceCep.ListCep(StrToInt(maskCep.Text));

   edtAdress.Text := modelCep.Logradouro;
   edtComplemento.Text := modelCep.Complemento;
   edtBairro.Text := modelCep.Bairro;
   edtLocalidade.Text := modelCep.Localidade;
   edtUf.text := modelCep.Uf;
  finally
    modelCep.Free;
  end;

end;

procedure TuFormPrincipal.Button1Click(Sender: TObject);
var
  clientRegister : TModelClient;
begin
  try
    clientRegister := TModelClient.Create;
    clientRegister.Name := edtName2.Text;
    clientRegister.Cep :=  StrToInt(maskCep.Text);
    clientRegister.Address := edtAdress.Text;
    clientRegister.Complement := edtComplemento.Text;
    clientRegister.Bairro := edtBairro.Text;
    clientRegister.Location := edtLocalidade.Text;
    clientRegister.Uf := edtUf.Text;

    if (RgDataBase.ItemIndex = -1) then
    begin
      ShowMessage('Informe um banco para inserir os dados.');
      Abort;
    end
    else
    begin
      TServiceClient.InsertRegisterDatabse(clientRegister,RgDataBase.ItemIndex);
    end;
  finally

  end;

end;

end.
