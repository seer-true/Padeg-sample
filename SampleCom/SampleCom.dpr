program SampleCom;

uses
  Vcl.Forms,
  frmMainTest in 'frmMainTest.pas' {frmTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTest, frmTest);
  Application.Run;

end.
