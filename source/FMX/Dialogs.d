module FMX.dialogs;

import delta.core;

void ShowMessage(string msg)
{
	executeClassMethodReturnNoneArgsString("Delta.FMX.Dialogs.TDialogs", "ShowMessage", msg);
}

string InputBox(string ACaption, string APrompt, string ADefault)
{
	return executeClassMethodReturnStringArgsStringStringString("Delta.FMX.Dialogs.TDialogs", "InputBox", ACaption, APrompt, ADefault);
}