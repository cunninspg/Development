#
# Testing String Manipulation
#
#
#
my $my_string ="Pinging albul.hilton.com [127.17.68.164] with 32 bytes of data:";

print $my_string;

@my_string=split(/\[|\]/,$my_string);
print "\n<";
print @my_string[1] , "\n";
print ">";

($mday, $mon, $year) = (localtime)[3, 4, 5];

print "$mday $mon $year \n";
++$mon;

$dest_mon = "$mon";
$mon = "0$mon" if $mon < 10;
$dest_mday="$mday";
$year = $year - 100;
$year = "0$year" if $year < 10;
$dest_year="$year";


print "A-$mday $mon $year \n";
print "B-$dest_mday $dest_mon $dest_year \n";

$new = $mon . "server";
print $new ;
print;


