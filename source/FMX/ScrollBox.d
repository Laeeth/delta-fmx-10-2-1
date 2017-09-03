module FMX.ScrollBox;

import delta.core;
import FMX.Controls.Presentation: TPresentedControl;

class TCustomPresentedScrollBox: TPresentedControl
{
	this(int reference)
	{
		super(reference);
	}
	
	void ClearContent()
	{
		executeInstanceMethodReturnNoneArgsNone(this.reference, "ClearContent");
	}
}