module FMX.ActnList;

import delta.core;
import System.Actions;
import System.Classes: TComponent;

class TCustomActionList: TContainedActionList
{
	this(int reference)
	{
		super(reference);
	}
}

class TActionList: TCustomActionList
{
	this(int reference)
	{
		super(reference);
	}
	
	static TActionList Create(TComponent owner)
	{
		
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.ActnList.TActionList", "Create", ownerReference);
		return new TActionList(reference);
	}
}

class TCustomAction: TContainedAction
{
	mixin(GenStringProperty!("Text"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TAction: TCustomAction
{
	this(int reference)
	{
		super(reference);
	}
	
	static TAction Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.ActnList.TAction", "Create", ownerReference);
		return new TAction(reference);
	}
}

