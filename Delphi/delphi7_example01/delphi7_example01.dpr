program delphi7_example01;
// �������� SMS �� Delphi ����� SMS-���� SMSPILOT.RU
// File - New - Other - Console Application

{$APPTYPE CONSOLE}

uses
  IdHTTP;

var phone, text, sender, apikey, url, response, id: string;
var pos_13,pos_comma: integer;
var http: TIdHTTP;
begin
  http := TIdHTTP.Create(nil);
  phone := '79037672215'; // ����� �������� � �������������� �������
  text := '��������'; // ����� ���������
  sender := '';  // ��� ����������� �� ������ https://www.smspilot.ru/my-sender.php
  // !!! �������� API-���� �� ���� https://www.smspilot.ru/my-settings.php#api
  apikey := 'XXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZXXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZ';

  url := 'http://www.smspilot.ru/api.php';
  url := url + '?send='    + http.URL.ParamsEncode( text );
  url := url + '&to='     + http.URL.ParamsEncode( phone );
  url := url + '&from='   + http.URL.ParamsEncode( sender );
  url := url + '&apikey=' + http.URL.ParamsEncode( apikey );
  url := url + '&charset=windows-1251';

  writeln( url );

  response := http.Get( url );
{
SUCCESS=SMS SENT 0.89/320.50
4566,79037672215,0.60,0}  if pos('ERROR', response ) = 1 then    writeln( response )  else begin    pos_13 := pos(#13, response );    pos_comma := pos(',', response);    id := copy( response, pos_13, pos_comma - pos_13-1 );    writeln( 'id=' + id ); // �������� ID ���������  end;

  writeln('Press [Enter]');
  readln;
end.
