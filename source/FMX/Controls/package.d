module FMX.Controls;

import delta.core;
import FMX.Types: TFmxObject;
import FMX.Graphics: TTextSettings;
import System.Classes, FMX.Types;

class TStyledControl: TControl
{
	this(int reference)
	{
		super(reference);
	}
}

enum TAlignLayout {None, Top, Left, Right, Bottom, MostTop, MostBottom, MostLeft, MostRight, Client, Contents, Center, VertCenter, HorzCenter, Horizontal, Vertical, Scale, Fit, FitLeft, FitRight};

class TTextControl: TStyledControl
{
	mixin(GenStringProperty!("Text"));
	mixin(GenBoolProperty!("WordWrap"));
	mixin(GenObjectProperty!("TextSettings", TTextSettings));
	mixin(GenSetProperty!("StyledSettings", TStyledSetting));
	
	this(int reference)
	{
		super(reference);
	}
}
	
class TControl: TFmxObject
{
	//mixin(GenEnumProperty!("Align", TAlignLayout));
	@property TAlignLayout Align() {
		return TAlignLayout.None;
	}
	
	mixin(GenBoolProperty!("Enabled"));
	mixin(GenFloatProperty!("Height"));
	mixin(GenStringProperty!("Hint"));
	mixin(GenObjectProperty!("Margins", TBounds));
    mixin(GenObjectProperty!("Position", TPosition));
    mixin(GenShortProperty!("TabOrder")); // not 100% OK: type TTabOrder = -1..32767;
	mixin(GenBoolProperty!("TabStop"));
	mixin(GenBoolProperty!("Visible"));
	mixin(GenFloatProperty!("Width"));
	
	
	mixin(GenEvent!("OnClick", TNotifyEvent));
	mixin(GenEvent!("OnDblClick", TNotifyEvent));
	
	this(int reference)
	{
		super(reference);
	}
}