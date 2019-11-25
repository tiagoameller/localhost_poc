unit pocMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext,
  IdServerIOHandler, IdSSL, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo:
        TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

(*
  <script>
  document.addEventListener("DOMContentLoaded", function () {
    var url = 'https://127.0.0.1:5000';

    $('body').click(function () {
      $.get(url, function (data, status) {
        alert(`Response from localhost: "${data}" with status: "${status}"`);
      });
    });
  });
  </script>
*)

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdHTTPServer1.Active := True;
end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext; ARequestInfo:
    TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  s: string;
begin
  with aResponseInfo do
  begin
     Beep;
     CustomHeaders.AddValue('Access-Control-Allow-Origin','*');
     s :=
       Format('Request received from %s at %s',
       [ARequestInfo.Host, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]);
     ContentText := s;
     ListBox1.Items.Add(s);
//     ContentText := '<html><head><title>My First Response</title></head>' +
//      '<body>Command: ' + ARequestInfo.Command +
//      '<br />Host: ' + ARequestInfo.Host +
//      '<br />URI: ' + ARequestInfo.URI +
//      '<br />UserAgent: ' + ARequestInfo.UserAgent +
//      '</body></html>';
  end;
end;

end.
