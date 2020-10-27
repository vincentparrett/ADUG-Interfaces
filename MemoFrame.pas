unit MemoFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DemoInterfaces;

type
  TAMemoFrame = class(TFrame, IClipboardProvider)
    Memo1: TMemo;
    procedure Memo1Enter(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
  private
    { Private declarations }
    FLogger : ILogger;
  protected
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanPaste: Boolean;
    procedure Copy;
    procedure Cut;
    procedure Paste;
    { Public declarations }
  public
    procedure SetLogger(const logger : ILogger);
  end;

implementation

uses
  Clipbrd,
  ClipbrdController;

{$R *.dfm}

function TAMemoFrame.CanCopy: Boolean;
begin
  result := Memo1.SelLength > 0;
end;

function TAMemoFrame.CanCut: Boolean;
begin
  result := Memo1.SelLength > 0;
end;

function TAMemoFrame.CanPaste: Boolean;
begin
  result := Clipboard.AsText <> '';
end;

procedure TAMemoFrame.Copy;
begin
  FLogger.Log(Debug, 'MemoFrame Copy');
  Memo1.CopyToClipboard;
end;

procedure TAMemoFrame.Cut;
begin
  FLogger.Log(Debug, 'MemoFrame Cut');
  Memo1.CopyToClipboard;
  Memo1.SelText := '';
end;

procedure TAMemoFrame.Memo1Enter(Sender: TObject);
begin
  ClipboardController.SetProvider(Self);
end;

procedure TAMemoFrame.Memo1Exit(Sender: TObject);
begin
  ClipboardController.UnsetProvider(Self);
end;

procedure TAMemoFrame.Paste;
begin
  FLogger.Log(Debug, 'MemoFrame Paste');
  Memo1.SelText := Clipboard.AsText;;
end;

procedure TAMemoFrame.SetLogger(const logger: ILogger);
begin
  FLogger := logger;
end;

end.
