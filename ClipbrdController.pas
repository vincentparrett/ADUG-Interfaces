unit ClipbrdController;

interface

uses
  DemoInterfaces;

type
  TClipboardController = class(TInterfacedObject, IClipboardController)
  private
    FProvider : IClipboardProvider;

  protected
    procedure SetProvider(const value: IClipboardProvider);
    procedure UnsetProvider(const value : IClipboardProvider);
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanPaste: Boolean;
    procedure Copy;
    procedure Cut;
    procedure Paste;
  public
    constructor Create;
    destructor Destroy;override;
  end;

function ClipboardController : IClipboardController;

implementation

{ TClipboardController }

function TClipboardController.CanCopy: Boolean;
begin
  result := (FProvider <> nil) and FProvider.CanCopy;
end;

function TClipboardController.CanCut: Boolean;
begin
  result := (FProvider <> nil) and FProvider.CanCut;
end;

function TClipboardController.CanPaste: Boolean;
begin
  result := (FProvider <> nil) and FProvider.CanPaste;
end;

procedure TClipboardController.Copy;
begin
  if FProvider <> nil then
    FProvider.Copy;
end;

constructor TClipboardController.Create;
begin
  FProvider := nil; //just for debugging, not strictly needed;
end;

procedure TClipboardController.Cut;
begin
  if FProvider <> nil then
    FProvider.Cut;
end;

destructor TClipboardController.Destroy;
begin
  FProvider := nil; //just for debugging, not strictly needed;
  inherited;
end;

procedure TClipboardController.Paste;
begin
  if FProvider <> nil then
    FProvider.Paste;
end;

procedure TClipboardController.SetProvider(const value: IClipboardProvider);
begin
  FProvider := value;
end;

procedure TClipboardController.UnsetProvider(const value: IClipboardProvider);
begin
  if FProvider = value then
    FProvider := nil;
end;


var
  _ClipboardController : IClipboardController;

function ClipboardController : IClipboardController;
begin
  result := _ClipboardController;
end;

initialization
_ClipboardController := TClipboardController.Create;
finalization
_ClipboardController := nil;
end.
