program ADUGIntfDemo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {MainWindow},
  LogViewFrame in 'LogViewFrame.pas' {LogFrame: TFrame},
  DemoInterfaces in 'DemoInterfaces.pas',
  SecondForm in 'SecondForm.pas' {AnotherForm},
  ClipbrdController in 'ClipbrdController.pas',
  MemoFrame in 'MemoFrame.pas' {AMemoFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.Run;
end.
