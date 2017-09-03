module FMX.Grid;

import delta.core;
import System.Classes;

import FMX.Controls: TControl, TTextControl;
import FMX.ScrollBox: TCustomPresentedScrollBox;

class TStringColumn: TColumn
{
	this(int reference)
	{
		super(reference);
	}
	
	static TStringColumn Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Grid.TStringColumn", "Create", ownerReference);
		return new TStringColumn(reference);
	}
}

class TColumn: TControl
{
	mixin(GenStringProperty!("Header"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TStringGrid: TCustomGrid
{	
	this(int reference)
	{
		super(reference);
	}
	
	static TStringGrid Create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Grid.TStringGrid", "Create", ownerReference);
		return new TStringGrid(reference);
	}
}

class TCustomGrid: TCustomPresentedScrollBox
{	
	
	mixin(GenIntegerIndexedProperty!("Columns", TColumn));
	mixin(GenIntProperty!("Col"));
	mixin(GenIntProperty!("ColumnCount"));
	mixin(GenIntProperty!("ColumnIndex"));
	mixin(GenIntProperty!("Row"));
	mixin(GenIntProperty!("RowCount"));
	mixin(GenIntProperty!("TopRow"));
	mixin(GenIntProperty!("VisibleColumnCount"));
	mixin(GenIntProperty!("VisibleRowCount"));
	
	this(int reference)
	{
		super(reference);
	}
	
	void ClearColumns()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "ClearColumns");
	}
}