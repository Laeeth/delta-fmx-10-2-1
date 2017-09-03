module FMX.StdCtrls;

import delta.core;
import FMX.Controls: TTextControl;
import System.Classes;

class TLabel: TTextControl
{
	this(int reference)
	{
		super(reference);
	}
	
	static TLabel Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.StdCtrls.TLabel", "Create", ownerReference);
		return new TLabel(reference);
	}
}


class TButton: TCustomButton
{
	this(int reference)
	{
		super(reference);
	}
	
	static TButton Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.StdCtrls.TButton", "Create", ownerReference);
		return new TButton(reference);
	}
}

class TCustomButton: TTextControl
{
	mixin(GenObjectProperty!("Action", TBasicAction));
	
	this(int reference)
	{
		super(reference);
	}
	
	static TCustomButton Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.StdCtrls.TCustomButton", "Create", ownerReference);
		return new TCustomButton(reference);
	}
}