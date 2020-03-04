#
# this file was used to get getting the date and then determine the date 
# in Australia.
#


use DateTime;

printf("\n------------- START -------------\n");

# get current time, then change timezone to Central
# -- what values can we have instead of Country/city
$dt = DateTime->now;
$dt->set_time_zone( 'America/Chicago' );

print "Central      $dt";
printf("\n");

# change timezone to Australia - (AUS is 17 hours ahead)
$dt->set_time_zone( 'Australia/Sydney' );

print "Australia    $dt";
printf("\n");
$ymday=$dt->day;
$ymon=$dt->month;
$yyear=$dt->year;
printf(">> %s %s %s <<\n\n",$ymday, $ymon, $yyear);

printf("\n---------------------------------\n");

# test adding hours to Central Time
$dt = DateTime->now;
$dt->set_time_zone( 'America/Chicago' );
$dt->add (hours => 17);
# print "Central+17   $dt";
# printf("\n");
printf("%-12s %s\n","Central+17", $dt);

#did not work - ($ymday, $ymon, $yyear)= $dt[1.2.3];
$ymday=$dt->day;
$ymon=$dt->month;
$yyear=$dt->year;
printf(">> %s %s %s <<\n\n",$ymday, $ymon, $yyear);

printf("\n---------------------------------\n");

#
# this section is just testing adding 17 to specific times
#
$dt = DateTime->new(
    year       => 2020,
    month      => 02,
    day        => 25,
    hour       => 13,
    minute     => 30,
    second     => 00,
    nanosecond => 500000000,
    time_zone  => 'America/Chicago' ,
);
print "Central   " . $dt;
printf("\n");

$dt->add (hours => 17);
print "Australia " . $dt;
printf("\n");

printf("\n");
$dt = DateTime->new(
    year       => 2020,
    month      => 02,
    day        => 25,
    hour       => 21,
    minute     => 02,
    second     => 00,
    nanosecond => 500000000,
    time_zone  => 'America/Chicago' ,
);
print "Central   " . $dt;
printf("\n");

$dt->add (hours => 17);
print "Australia " . $dt;
printf("\n");
printf("\n---------------------------------\n");

($ymday, $ymon, $yyear) = (localtime())[3, 4, 5];
++$ymon;
$ymon = "0$ymon" if $ymon < 10;
$ymday = "0$ymday" if $ymday < 10;
$yyear = $yyear - 100;
$yyear = "0$yyear" if $yyear < 10;
$src_folder_date = "$ymday-$ymon-20$yyear";
printf("date = %s\n", $src_folder_date);

($ymday, $ymon, $yyear) = (localtime(time + 3600*16 ))[3, 4, 5];
++$ymon;
$ymon = "0$ymon" if $ymon < 10;
$ymday = "0$ymday" if $ymday < 10;
$yyear = $yyear - 100;
$yyear = "0$yyear" if $yyear < 10;
$src_folder_date = "$ymday-$ymon-20$yyear";
printf("date = %s\n", $src_folder_date);

printf("\n-------------- END --------------\n");
