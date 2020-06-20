program OXOYay;

uses
  Vcl.Forms,
  OXOBest in 'OXOBest.pas' {MainGame},
  OXONormal in 'OXONormal.pas' {MiniGame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainGame, MainGame);
  Application.CreateForm(TMiniGame, MiniGame);
  Application.Run;
end.
