module FMX.Forms;

import delta.core;
import delta.core.events;
import System.Classes;
import FMX.Types: TFmxObject;
import FMX.Graphics: TBrushKind, TBrush;
import System.UITypes: TCloseAction;

alias TIdleEvent = void delegate(TObject sender, ref bool done);

private TApplication _application;

@property TApplication Application()
{
	if (_application is null)
	{
		int r = executeClassMethodReturnReferenceArgsNone("Delta.FMX.Forms.TForms", "GetApplication");
		_application = new TApplication(r);
	}
	return _application;
}

class TApplication: TComponent
{	
	alias reference this;
	
	mixin(GenObjectProperty!("MainForm", TCommonCustomForm));
	mixin(GenEvent2!("OnIdle", TIdleEvent));
	
	this(int reference)
	{
		super(reference);
	}
	
	void Initialize()
	{
		executeInstanceMethodReturnNoneArgsNone(this, "Initialize");
	}
	
	void Run()
	{
		executeInstanceMethodReturnNoneArgsNone(this, "Run");
	}
	
	void Terminate()
	{
		executeInstanceMethodReturnNoneArgsNone(this, "Terminate");
	}
}


alias TCloseEvent = void delegate(TObject sender, ref TCloseAction action);
alias TCloseQueryEvent = void delegate (TObject sender, ref bool canClose);

enum TDeviceKind {
	Desktop, 
	iPhone, 
	iPad
};

alias TDeviceKinds = TDeviceKind[]; // TODO Set of TDeviceKinds

class TFormFactor: TPersistent
{
	mixin(GenSetProperty!("Devices", TDeviceKind));
	mixin(GenIntProperty!("Height"));
	mixin(GenIntProperty!("Width"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TCommonCustomForm: TFmxObject
{	
	mixin(GenStringProperty!("Caption"));
	mixin(GenIntProperty!("ClientHeight"));
	mixin(GenIntProperty!("ClientWidth"));
	mixin(GenObjectProperty!("FormFactor", TFormFactor));
	mixin(GenIntProperty!("Left"));
	mixin(GenIntProperty!("Top"));
	mixin(GenBoolProperty!("Visible"));
	
	mixin(GenEvent!("OnCreate", TNotifyEvent));
	mixin(GenEvent!("OnActivate", TNotifyEvent));
	mixin(GenEvent!("OnShow", TNotifyEvent));
	
	void Close()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "Close");
	}
	
	void Show()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "Show");
	}
	
	this(int reference)
	{
		super(reference);
	}
	
	static TCommonCustomForm Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Forms.TCommonCustomForm", "Create", ownerReference);
		return new TCommonCustomForm(reference);
	}
}

class TCustomForm: TCommonCustomForm
{	
	this(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int dummy;
		int reference = executeClassMethodReturnReferenceArgsReferenceInt("FMX.Forms.TCustomForm", "CreateNew", ownerReference, dummy);
		super(reference);
	}
	
	this(int reference)
	{
		super(reference);
	}
	
	static TCustomForm Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Forms.TCustomForm", "Create", ownerReference);
		return new TCustomForm(reference);
	}
	
	static T CreateNew(T: TCustomForm)(TComponent owner, int dummy = 0)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReferenceInt("FMX.Forms.TCustomForm", "CreateNew", ownerReference, dummy);
		return new T(reference);
	}
}

class TForm: TCustomForm
{	
	this(int reference)
	{
		super(reference);
	}
	
	static TForm Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Forms.TForm", "Create", ownerReference);
		return new TForm(reference);
	}
}