program SamplesFIO;

uses
{$IFDEF DEBUG}
  FastMM4 in '..\..\..\FastMM4\FastMM4.pas',
{$ENDIF }
  Vcl.Forms,
  DeclThread in 'DeclThread.pas',
  frmMain in 'frmMain.pas' {frmMainDecl} ,
  padegFIO in 'padegFIO.pas';

{$R *.res}
{$DEFINE EnableMemoryLeakReporting}
{$DEFINE RequireDebuggerPresenceForLeakReporting}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  try
    Application.CreateForm(TfrmMainDecl, frmMainDecl);
    Application.Run;
  finally
    DeInitialization;
  end;

end.
