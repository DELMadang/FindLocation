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
    procedure btnExecuteClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
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

procedure TfrmMain.btnExecuteClick(Sender: TObject);
begin
  eMemo.Text := GetLocation(eIPAddress.Text);
end;

end.

