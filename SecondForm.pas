unit SecondForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DemoInterfaces, Vcl.StdCtrls;

type
  TAnotherForm = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    FLogger : ILogger;
  protected
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; const logger : ILogger);reintroduce;
  end;

var
  AnotherForm: TAnotherForm;

implementation


{$R *.dfm}

{ TForm1 }

procedure TAnotherForm.Button1Click(Sender: TObject);
begin
  FLogger.Log(Error, 'Oh dear, an error occured in AnotherForm');
end;


constructor TAnotherForm.Create(AOwner: TComponent; const logger: ILogger);
begin
  inherited Create(AOwner);
  FLogger := logger;
end;


end.
