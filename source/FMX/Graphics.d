module FMX.Graphics;

import delta.core;

import System.Classes;
import System.UITypes;

enum TBrushKind { None, Solid, Gradient, Bitmap, Resource }

class TBrush: TPersistent
{
	mixin(GenUIntProperty!("Color"));
	mixin(GenEnumProperty!("Kind", TBrushKind));
	mixin(GenObjectProperty!("Gradient", TGradient));
	
	this(int reference)
	{
		super(reference);
	}
}

class TGradientPoint: TCollectionItem
{
	mixin(GenUIntProperty!("Color"));
	mixin(GenFloatProperty!("Offset"));
	
	this(int reference)
	{
		super(reference);
	}
}

class TTextSettings: TPersistent
{
	mixin(GenUIntProperty!("FontColor"));
	mixin(GenObjectProperty!("Font", TFont));
	
	package this(int reference)
	{
		super(reference);
	}
}

class TFont: TPersistent
{
	mixin(GenFloatProperty!("Size"));
	mixin(GenSetProperty!("Style", TFontStyle));
	
	package this(int reference)
	{
		super(reference);
	}
}

class TGradientPoints: TCollection
{
	this(int reference)
	{
		super(reference);
	}
	
	TGradientPoint opIndex(size_t index)
	{
		// TODO
		return null;
	}
}

class TGradient: TPersistent
{
	mixin(GenObjectProperty!("Points", TGradientPoints));

	this(int reference)
	{
		super(reference);
	}
}