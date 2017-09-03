module FMX.Memo;

import delta.core;
import System.Classes;

import FMX.ScrollBox: TCustomPresentedScrollBox;

class TMemo: TCustomMemo
{	
	this(int reference)
	{
		super(reference);
	}
	
	static TMemo Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Memo.TMemo", "Create", ownerReference);
		return new TMemo(reference);
	}
}

class TCustomMemo: TCustomPresentedScrollBox
{
	mixin(GenStringProperty!("Text")); 
	mixin(GenObjectProperty!("Lines", TStrings)); 

	this(int reference)
	{
		super(reference);
	}
}