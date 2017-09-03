module FMX.Types;

// Word => ushort

import delta.core;
import System.Classes, System.Generics.Collections;

alias TKeyEvent = void delegate(TObject sender, out ushort key, out wchar keyChar, TShiftState shift);

enum TStyledSetting  {Family, Size, Style, FontColor, Other};

class TFmxChildrenList: TEnumerable!TFmxObject
{
	this(int reference)
	{
		super(reference);
	}
}

class TFmxObject: TComponent
{
	mixin(GenObjectProperty!("Parent", TFmxObject));
	mixin(GenObjectProperty!("tagObject", TObject));
	mixin(GenStringProperty!("TagString"));
	mixin(GenFloatProperty!("TagFloat"));
	mixin(GenObjectProperty!("Children", TFmxChildrenList));

	this(int reference)
	{
		super(reference);
	}
	
	void AddObject(TFmxObject AObject)
	{
		executeInstanceMethodReturnNoneArgsReference(this.reference, "AddObject", AObject.reference);
	}
	
	void DeleteChildren()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "DeleteChildren");
	}
	
	
}

class TPosition: TPersistent
{
	mixin(GenBoolProperty!("StoreAsInt"));
	mixin(GenFloatProperty!("X"));
	mixin(GenFloatProperty!("Y"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TBounds: TPersistent
{
	mixin(GenFloatProperty!("Bottom"));
	mixin(GenFloatProperty!("Left"));
	mixin(GenFloatProperty!("Right"));
	mixin(GenFloatProperty!("Top"));
	
	this(int reference)
	{
		super(reference);
	}
}