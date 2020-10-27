unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, LogViewFrame, Vcl.ExtCtrls, Vcl.StdCtrls, DemoInterfaces, Vcl.ToolWin, Vcl.ComCtrls, System.Actions, Vcl.ActnList, Vcl.ImgList, MemoFrame,
  System.ImageList, Vcl.AppEvnts;

type
  TMainWindow = class(TForm, IClipboardProvider)
    Panel1: TPanel;
    LogFrame1: TLogFrame;
    Button1: TButton;
    Button2: TButton;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    actEditCut: TAction;
    actEditCopy: TAction;
    actEditPaste: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    AMemoFrame1: TAMemoFrame;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LogFrame1LogMemoEnter(Sender: TObject);
    procedure LogFrame1LogMemoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FLogger : ILogger;
    FClipboardProvider : IClipboardProvider;


  protected
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanPaste: Boolean;
    procedure Copy;
    procedure Cut;
    procedure Paste;
  public
    { Public declarations }
  end;

var
  MainWindow: TMainWindow;

implementation

uses
  ClipbrdController,
  SecondForm;

{$R *.dfm}

var
  count : Int64;

procedure TMainWindow.actEditCopyExecute(Sender: TObject);
begin
  ClipboardController.Copy;
end;

procedure TMainWindow.actEditCutExecute(Sender: TObject);
begin
  ClipboardController.Cut;
end;

procedure TMainWindow.actEditPasteExecute(Sender: TObject);
begin
  ClipboardController.Paste;
end;

procedure TMainWindow.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  actEditCut.Enabled := ClipboardController.CanCut;
  actEditCopy.Enabled := ClipboardController.CanCopy;
  actEditPaste.Enabled := ClipboardController.CanPaste;
  Handled := true;
end;

procedure TMainWindow.Button1Click(Sender: TObject);
begin
  FLogger.Log(Debug, 'Debug message');
end;

procedure TMainWindow.Button2Click(Sender: TObject);
begin
  if AnotherForm = nil then
    AnotherForm := TAnotherForm.Create(Application, FLogger);
  AnotherForm.Show;
end;

procedure TMainWindow.Button3Click(Sender: TObject);
begin
  ClipboardController.UnsetProvider(LogFrame1);
  LogFrame1.Free;
end;

function TMainWindow.CanCopy: Boolean;
begin
  result := FClipboardProvider.CanCopy;
end;

function TMainWindow.CanCut: Boolean;
begin
  result := FClipboardProvider.CanCut;
end;

function TMainWindow.CanPaste: Boolean;
begin
  result := FClipboardProvider.CanPaste;
end;

procedure TMainWindow.Copy;
begin
  FClipboardProvider.Copy;
end;

procedure TMainWindow.Cut;
begin
  FClipboardProvider.Cut;
end;

procedure TMainWindow.FormActivate(Sender: TObject);
begin
  ClipboardController.SetProvider(Self);
end;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
  FLogger := LogFrame1 as ILogger;
  FClipboardProvider := LogFrame1 as IClipboardProvider;
  AMemoFrame1.SetLogger(FLogger);
end;

procedure TMainWindow.FormDeactivate(Sender: TObject);
begin
  ClipboardController.UnSetProvider(Self);
end;

procedure TMainWindow.LogFrame1LogMemoEnter(Sender: TObject);
begin
  ClipboardController.SetProvider(Self);
end;

procedure TMainWindow.LogFrame1LogMemoExit(Sender: TObject);
begin
  ClipboardController.UnSetProvider(Self);
end;

procedure TMainWindow.Paste;
begin
  FClipboardProvider.Paste;
end;

end.
