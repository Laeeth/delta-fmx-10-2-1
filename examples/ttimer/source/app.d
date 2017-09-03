import std.stdio;

import delta.core;
import System.Classes, FMX.Forms, FMX.Types;

class TTimerExample: TFmxObject
{
	mixin(GenBoolProperty!("Enabled"));
	mixin(GenUIntProperty!("Interval"));
	mixin(GenEvent!("OnTimer", TNotifyEvent));
	
	this(int reference)
	{
		super(reference);
	}
	
	static TTimerExample Create(TComponent owner)
	{
		
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("FMX.Types.TTimer", "Create", ownerReference);
		return new TTimerExample(reference);
	}
}

void main()
{
	deltaLibrary.load(`.\views\Win32\Debug\Project1.dll`);
	auto timer = TTimerExample.Create(null);
	timer.OnTimer = (TObject sender) {
		writeln("Hello World!");
	};
	Application.Run();
}
