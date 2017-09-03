module FMX.TreeView;

import delta.core;
import System.Classes;

import FMX.Layouts: TScrollBox;
import FMX.Controls: TTextControl;

class TTreeViewItem: TTextControl
{
	this(int reference)
	{
		super(reference);
	}
	
	static TTreeViewItem Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.TreeView.TTreeViewItem", "Create", ownerReference);
		return new TTreeViewItem(reference);
	}
}

class TTreeView: TCustomTreeView
{	
	this(int reference)
	{
		super(reference);
	}
	
	static TTreeView Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.TreeView.TTreeView", "Create", ownerReference);
		return new TTreeView(reference);
	}
}

class TCustomTreeView: TScrollBox
{
	//mixin(GenObjectProperty!("Items", TTreeViewItem[])); // Readonly
	mixin(GenObjectProperty!("Selected", TTreeViewItem));
	mixin(GenIntProperty!("Count")); // TODO: Readonly
	
	mixin(GenEvent!("OnChange", TNotifyEvent));
	
	this(int reference)
	{
		super(reference);
	}
	
	TTreeViewItem Items(int index)
	{
		int reference = executeInstanceMethodReturnReferenceArgsInt(this.reference, "Items", index);
		return new TTreeViewItem(reference);
	}
	
	void Clear()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "Clear");
	}
	
	void ExpandAll()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "ExpandAll");
	}
}