unit Delta.FMX.Dialogs;

interface

uses System.classes, FMX.Dialogs, FMX.DialogService;

type
  TDialogs = class(TComponent)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    class procedure ShowMessage(const Msg: string);
    class function InputBox(const ACaption, APrompt, ADefault: string): string;
  end;

implementation

{ TDialogs }

class procedure TDialogs.ShowMessage(const Msg: string);
begin
  FMX.Dialogs.ShowMessage(Msg);
end;

class function TDialogs.InputBox(const ACaption, APrompt, ADefault: string): string;
begin
  result := FMX.Dialogs.InputBox(ACaption, APrompt, ADefault);
end;

end.
