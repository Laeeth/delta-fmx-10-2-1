unit Delta.FMX.Forms;

interface

uses System.classes, System.rtti, System.TypInfo, System.UITypes, FMX.Forms;

type
  TPBoolean = ^Boolean;

type
  TPInteger = ^Integer;

type
  TIdleEventCallBack = procedure(Reference: Integer;
    DReference, DFuncPointer: Integer; PDone: TPBoolean); stdcall;

type
  TCloseEventCallBack = procedure(Reference: Integer; DReference: Integer;
    PCloseAction: TPInteger); stdcall;

procedure registerIdleEvent(Reference: Integer; AName: PAnsiChar;
  DReference, DFuncPointer: Integer; CallBack: TIdleEventCallBack); stdcall;

procedure registerCloseEvent(Reference: Integer; AName: PAnsiChar;
  DReference: Integer; CallBack: TCloseEventCallBack); stdcall;

type
  TIdleEventWrapper = class(TComponent)
  private
    FCallBack: TIdleEventCallBack;
    FDReference: Integer;
    FDFuncPointer: Integer;
  public
    constructor Create(Owner: TComponent; DReference, DFuncPointer: Integer;
      CallBack: TIdleEventCallBack); reintroduce;
  published
    procedure Event(Sender: TObject; var Done: Boolean);
  end;

type
  TCloseEventWrapper = class(TComponent)
  private
    FCallBack: TCloseEventCallBack;
    FDReference: Integer;
  public
    constructor Create(Owner: TComponent; DReference: Integer;
      CallBack: TCloseEventCallBack); reintroduce;
  published
    procedure Event(Sender: TObject; var Action: TCloseAction);
  end;

type
  TForms = class(TComponent)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    class function GetApplication: TApplication; static;
  end;

exports registerIdleEvent, registerCloseEvent;

implementation

uses Delta.Properties;

procedure registerIdleEvent(Reference: Integer; AName: PAnsiChar;
  DReference, DFuncPointer: Integer; CallBack: TIdleEventCallBack); stdcall;
var
  nEvent: TIdleEvent;
  component: TComponent;
begin
  if Assigned(CallBack) then
  begin
    try
      component := TComponent(Reference);
      nEvent := TIdleEventWrapper.Create(component, DReference, DFuncPointer,
        CallBack).Event;
      setPropertyValue(Reference, string(AName),
        TValue.From<TIdleEvent>(nEvent));
    except
    end;
  end
  else
  begin
    setPropertyValue(Reference, string(AName), nil);
  end;
end;

procedure registerCloseEvent(Reference: Integer; AName: PAnsiChar;
  DReference: Integer; CallBack: TCloseEventCallBack); stdcall;
var
  nEvent: TCloseEvent;
  component: TComponent;
begin
  if Assigned(CallBack) then
  begin
    try
      component := TComponent(Reference);
      nEvent := TCloseEventWrapper.Create(component, DReference,
        CallBack).Event;
      setPropertyValue(Reference, string(AName),
        TValue.From<TCloseEvent>(nEvent));
    except
    end;
  end
  else
  begin
    setPropertyValue(Reference, string(AName), nil);
  end;
end;

{ TIdleEventWrapper }

constructor TIdleEventWrapper.Create(Owner: TComponent;
  DReference, DFuncPointer: Integer; CallBack: TIdleEventCallBack);
begin
  inherited Create(Owner);
  FCallBack := CallBack;
  FDReference := DReference;
  FDFuncPointer := DFuncPointer;
end;

procedure TIdleEventWrapper.Event(Sender: TObject; var Done: Boolean);
begin
  FCallBack(Integer(Sender), FDReference, FDFuncPointer, @Done);
end;

{ TCloseEventWrapper }

constructor TCloseEventWrapper.Create(Owner: TComponent; DReference: Integer;
  CallBack: TCloseEventCallBack);
begin
  inherited Create(Owner);
  FCallBack := CallBack;
  FDReference := DReference;
end;

procedure TCloseEventWrapper.Event(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  I := ORD(Action);
  FCallBack(Integer(Sender), FDReference, @I);
  Action := TCloseAction(I);
end;

{ TForms }

class function TForms.GetApplication: TApplication;
begin
  result := Application;
end;

end.
