unit DemoInterfaces;

interface


type
  TLogLevel = (Debug, Info,Warning, Error);

  ILogger = interface
  ['{156AC1CA-E300-4F2B-ACF5-A14F8CA32859}']
    procedure Log(const level : TLogLevel; const value : string);
  end;

  IClipboardProvider = interface
  ['{7AE75055-8417-4CB2-8172-82B9DBFC08AE}']
    function CanCut : boolean;
    function CanCopy : boolean;
    function CanPaste : boolean;
    procedure Cut;
    procedure Copy;
    procedure Paste;
  end;


  IClipboardController = interface(IClipboardProvider)
  ['{9B60E1BD-341B-4BE1-B2E5-647DAB4006BC}']
    procedure SetProvider(const value : IClipboardProvider);
    procedure UnsetProvider(const value : IClipboardProvider);
  end;

implementation

end.
