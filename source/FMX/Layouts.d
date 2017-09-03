module FMX.Layouts;

import delta.core;
import FMX.Controls: TControl, TStyledControl;
import System.Classes: TComponent;

class TScrollBox: TStyledControl
{
	this(int reference)
	{
		super(reference);
	}
}

class TLayout: TControl
{
	this(int reference)
	{
		super(reference);
	}
	
	static TLayout Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Layouts.TLayout", "Create", ownerReference);
		return new TLayout(reference);
	}
}