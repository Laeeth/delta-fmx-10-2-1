library Project1;

{$STRONGLINKTYPES ON}

uses
  System.SysUtils,
  System.Classes,
  FMX.Forms,
  Delta.FMX.Dialogs,
  Delta.Methods,
  Delta.Properties,
  Delta.System.Classes,
  Delta.FMX.Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
end.
