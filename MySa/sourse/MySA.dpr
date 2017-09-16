program MySA;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  f_Settings in 'f_Settings.pas' {SetForm},
  f_Connection in 'f_Connection.pas' {ConForm},
  f_NETsrch in 'f_NETsrch.pas' {SrchForm},
  f_DHCPFile in 'f_DHCPFile.pas' {DHCPForm},
  f_MacBlock in 'f_MacBlock.pas' {MBForm},
  f_MacSrch in 'f_MacSrch.pas' {MacSrchForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'My SNMP Agent';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSetForm, SetForm);
  Application.CreateForm(TConForm, ConForm);
  Application.CreateForm(TSrchForm, SrchForm);
  Application.CreateForm(TDHCPForm, DHCPForm);
  Application.CreateForm(TMBForm, MBForm);
  Application.CreateForm(TMacSrchForm, MacSrchForm);
  Application.Run;
end.
