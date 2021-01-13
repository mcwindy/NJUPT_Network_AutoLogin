$login_type='$args[0]'
$login_id='$args[1]';
$login_password='$args[2]';

Switch ($login_type)
{
    '0' {echo '0!';}
    '1' {$login_id=",0,${login_id}@njxy";}
    '2' {$login_id=",0,${login_id}@cmcc";}
}

$agent="User-Agent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.9 Safari/537.36";

$return_url=(Invoke-WebRequest -UserAgent $agent -UseBasicParsing http://www.baidu.com).Links.outerHTML;
# echo $return_url

$hostport=801;
$hostname="p.njupt.edu.cn";

$return_url -match "wlanuserip=(.*?)&";
$userip=$matches[1];

$return_url -match "wlanacip=(.*?)&";
$acip=$matches[1];

$cname="XL-BRAS-SR8806-X";

Invoke-WebRequest -UseBasicParsing -UserAgent  $agent "http://${hostname}:${hostport}/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=${hostname}&iTermType=1&wlanuserip=${userip}&wlanacip=${acip}&wlanacname=${cname}&mac=00-00-00-00-00-00&ip=${userip}&enAdvert=0&queryACIP=0&loginMethod=1" -Method POST -Body "DDDDD=${login_id}&upass=${login_password}&R1=0&R2=0&R3=0&R6=0&para=00&0MKKey=123456&buttonClicked=&redirect_url=&err_flag=&username=&password=&user=&cmd=&Login=&v6ip="
