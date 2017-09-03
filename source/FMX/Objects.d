module FMX.Objects;

import delta.core;
import FMX.Controls: TControl;
import FMX.Graphics: TBrush;
import System.Classes: TComponent;

class TShape: TControl
{
	mixin(GenObjectProperty!("Fill", TBrush));
	
	this(int reference)
	{
		super(reference);
	}
}

class TRectangle: TShape
{
	this(int reference)
	{
		super(reference);
	}
	
	static TRectangle Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Objects.TRectangle", "Create", ownerReference);
		return new TRectangle(reference);
	}
}
