import delta.core;
import System.Classes, FMX.Forms, FMX.StdCtrls, FMX.Edit, FMX.Dialogs;

void main()
{
	deltaLibrary.load(`.\views\Win32\Debug\Project1.dll`);
	Application.OnIdle = (TObject sender, ref bool done) {
		mainForm = new TMainForm(Application.FindComponent("MainForm").reference);		
		done = true;
		Application.OnIdle = null;
	};
	Application.Run();
}

TMainForm mainForm;

class TMainForm: TForm
{
	@FormComponent
	TEdit Edit1;
	
	@FormComponent 
	@FormEvent("OnClick", "OnButton1Click")
	TButton Button1;

	this(int reference)
	{
		super(reference);
		mixin formLogic;
	}
	
	static TMainForm create(TComponent owner)
	{
		int ownerReference = owner is null ? nil : owner.reference;
		int reference = executeClassMethodReturnReferenceArgsReference("Main.TMainForm", "Create", ownerReference);
		return new TMainForm(reference);
	}
	
	void OnButton1Click(TObject sender)
	{
		ShowMessage(Edit1.Text);
	}
}