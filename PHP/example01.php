<?php // отправка SMS через шлюз SMSPILOT.RU на чистом PHP
$phone = '79037672215'; // номер телефона в международном формате
$text = 'проверка'; // текст сообщения
$sender = 'INFORM'; //  имя отправителя из списка https://smspilot.ru/my-sender.php
// !!! Замените API-ключ на свой https://smspilot.ru/my-settings.php#api
$apikey = 'XXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZXXXXXXXXXXXXYYYYYYYYYYYYZZZZZZZZ';

$url = 'http://smspilot.ru/api.php?send='.urlencode( $text ).'&to='.urlencode( $phone ).'&from='.$from.'&apikey='.$apikey.'&format=json';

$json = file_get_contents( $url );
echo $json.'<br/>';
// {"send":[{"server_id":"10000","phone":"79037672215","price":"1.68","status":"0"}],"balance":"11908.50","cost":"1.68"}
$j = json_decode( $json, true );
echo 'id='.$j['send'][0]['server_id'].'<br/>';
// id=10000
