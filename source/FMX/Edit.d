module FMX.Edit;

import delta.core;
import FMX.Controls: TStyledControl;
import FMX.Controls.Presentation;
import System.Classes: TComponent;

class TCustomEdit: TPresentedControl
{
	mixin(GenStringProperty!("Text"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TEdit: TCustomEdit
{
	this(int reference)
	{
		super(reference);
	}
	
	static TEdit Create(TComponent owner)
	{
		
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Edit.TEdit", "Create", ownerReference);
		return new TEdit(reference);
	}
}