unit LogViewFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DemoInterfaces, Vcl.StdCtrls;

type
  TLogFrame = class(TFrame, ILogger, IClipboardProvider)
    LogMemo: TMemo;
  private
    { Private declarations }
  protected
    procedure Log(const level: TLogLevel; const value: string);
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanPaste: Boolean;
    procedure Copy;
    procedure Cut;
    procedure Paste;
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TLogFrame }

function TLogFrame.CanCopy: Boolean;
begin
  result := LogMemo.SelLength > 0;
end;

function TLogFrame.CanCut: Boolean;
begin
  result := false;
end;

function TLogFrame.CanPaste: Boolean;
begin
  result := false;
end;

procedure TLogFrame.Copy;
begin
  LogMemo.CopyToClipboard;

end;

procedure TLogFrame.Cut;
begin
  //
end;

procedure TLogFrame.Log(const level: TLogLevel; const value: string);
  const prefixes : array[TLogLevel] of string = ('DBG', 'INF', 'WRN', 'ERR');
begin
  LogMemo.Lines.Add(prefixes[level] + ' : ' + value);
end;


procedure TLogFrame.Paste;
begin

end;

end.
