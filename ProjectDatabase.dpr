program ProjectDatabase;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {uFormPrincipal},
  uModelCep in 'Model\uModelCep.pas',
  uRepository.Cep in 'Repository\uRepository.Cep.pas',
  uServiceCep in 'Service\uServiceCep.pas',
  uModelClient in 'Model\uModelClient.pas',
  uRepositoryClient in 'Repository\uRepositoryClient.pas',
  uServiceClient in 'Service\uServiceClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuFormPrincipal, uFormPrincipal);
  Application.Run;
end.
