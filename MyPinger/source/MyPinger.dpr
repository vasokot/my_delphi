program MyPinger;

uses
  Forms,
  Main in 'Main.pas' {PingForm},
  uPinger in 'uPinger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'AllPinger';
  Application.CreateForm(TPingForm, PingForm);
  Application.Run;
end.
