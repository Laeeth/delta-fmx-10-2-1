module FMX.ListBox;

import delta.core;
import System.Classes;
import FMX.Layouts: TScrollBox;
import FMX.Controls: TTextControl;

class TListBoxItem: TTextControl
{
	this(int reference)
	{
		super(reference);
	}
	
	static TListBoxItem Create(TComponent owner)
	{
		
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.ListBox.TListBoxItem", "Create", ownerReference);
		return new TListBoxItem(reference);
	}
}

class TListBox: TCustomListBox
{	
	this(int reference)
	{
		super(reference);
	}
	
	static TListBox Create(TComponent owner)
	{
		
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.ListBox.TListBox", "Create", ownerReference);
		return new TListBox(reference);
	}
}

class TCustomListBox: TScrollBox
{
	mixin(GenObjectProperty!("Items", TStrings));
	mixin(GenObjectProperty!("Selected", TListBoxItem));
	mixin(GenIntProperty!("ItemIndex"));
	mixin(GenIntProperty!("Count")); // TODO: Readonly

	
	mixin(GenEvent!("OnChange", TNotifyEvent));
	
	this(int reference)
	{
		super(reference);
	}
}