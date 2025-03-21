unit uMain;

interface

uses
  System.SysUtils,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    eIPAddress: TEdit;
    lbIPAddress: TLabel;
    eMemo: TMemo;
    btnExecute: TButton;
    btnMyIP: TButton;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnMyIPClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.JSON,
  System.Net.HttpClient;

function GetLocation(const AIP: string): string;
begin
  Result := '';
  var LHttp := THttpClient.Create;
  try
    var LResponse := LHttp.Get(Format('https://ipapi.co/%s/json/', [AIP]));
    Result := LResponse.ContentAsString(TEncoding.UTF8);
  finally
    LHttp.Free;
  end;
end;

function GetMyIP(): string;
begin
  Result := '';
  var LHttp := THttpClient.Create;
  try
    var LResponse := LHttp.Get('https://ipapi.co/json/');
    if LResponse.StatusCode = 200 then
    begin
      var LJSON := TJSONObject.ParseJSONValue(LResponse.ContentAsString(TEncoding.UTF8)) as TJSONObject;
      try
        Result := LJSON.GetValue<string>('ip');
      finally
        LJSON.Free;
      end;
    end;
  finally
    LHttp.Free;
  end;
end;

procedure TfrmMain.btnExecuteClick(Sender: TObject);
begin
  eMemo.Text := GetLocation(eIPAddress.Text);
end;

procedure TfrmMain.btnMyIPClick(Sender: TObject);
begin
  eMemo.Text := GetMyIP();
end;

end.

