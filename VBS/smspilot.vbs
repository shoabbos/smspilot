' SMS ����� SMSPILOT.RU
Phone = "79087964781"
' ��� ��������� ��������� ����� ����� ������� ������, ������� ���������� ��������
Text = "Otpravka SMS cherez SMSPILOT WSH VBS"
APIKEY = "����� ����� ���������� ���� API-���� https://www.smspilot.ru/settings.php#api"

SMS = False

Set HttpReq = CreateObject("WinHttp.WinHttpRequest.5.1")

URL = "http://smspilot.ru/api.php"
URL = URL & "?send=" & Replace(Text," ", "%20")
URL = URL & "&to=" & Phone

' ���� �������
' URL = URL & "&from=smspilot"

' (!) �������� �� ���� API-����
URL = URL & "&apikey=" & APIKEY

If HttpReq.Open("GET", URL, False) <> 0 Then
  wscript.echo "Connection error"
ElseIf HttpReq.Send() <> 0 Then
  wscript.echo "Open URL " & URL & " error"
Else
  wscript.echo HttpReq.responseText
End If