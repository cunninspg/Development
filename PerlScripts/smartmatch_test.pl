use v5.10.1;
my @little = qw(red blue green);
my @bigger = ("red", "blue", [ "orange", "green" ] );
if (@little ~~ @bigger) { # true!
say "little is contained in bigger";
}

if ( $bigger[0] == "red" ) {
	print "RED\n";
}
if ( $bigger[1] == "blue" ) {
	print "BLUE\n";
}
if ( $bigger[3] == "orange" ) {
	print "ORANGE\n";
}
if ( $bigger[3] == "green" ) {
	print "GREEN\n";
}

print "<2,0 $bigger[2][0]>\n";
print "<2,1 $bigger[2][1]>\n";


my @a = (0, 1, 2, [3, [4, 5], 6], 7);
my @b = (0, 1, 2, [3, [4, 5], 6], 7);
if (@a ~~ @b && @b ~~ @a) {
    say "a and b are deep copies of each other";
}
elsif (@a ~~ @b) {
    say "a smartmatches in b";
}
elsif (@b ~~ @a) {
    say "b smartmatches in a";
}
else {
    say "a and b don't smartmatch each other at all";
}


my $x=1;  # 0001
my $y=2;  # 0010
my $z=3;  # 0011
print "\n\n-------------\n";
print "x - 1 is on\n" if ($x & 1) == 1;
print "x - 2 is on\n" if ($x & 2) == 2;
print "x - 4 is on\n" if ($x & 4) == 4;
print "-------------\n";
print "y - 1 is on\n" if ($y & 1) == 1;
print "y - 2 is on\n" if ($y & 2) == 2;
print "y - 4 is on\n" if ($y & 4) == 4;
print "-------------\n";
print "z - 1 is on\n" if ($z & 1) == 1;
print "z - 2 is on\n" if ($z & 2) == 2;
print "z - 3 is on\n" if ($z & 3) == 3;
print "z - 4 is on\n" if ($z & 4) == 4;
print "-------------\n\n\n";

 $x = 0; 
 print " turning bit 1 on <1>\n";
 $x = $x | 1;
 print "x = $x\n";

 print " turning bit 2 on <3>\n";
 $x = $x | 2;
 print "x = $x\n";
 
 print " turning bit 3 on <7>\n";
 $x = $x | 4;
 print "x = $x\n";


 print " turning bit 2 off <5>\n";
 $x = $x & 13; # 15-2=13  or 1111 = 0010 = 1101
 print "x = $x\n";
 
  
 # print " turning bit 2 off <5>\n";
 # $x = $x ^ 2;
 # print "x = $x\n";
 
# this is xor   so turn on if off, off if on
# print " turning bit 2 off <5>\n";
# $x = $x ^ 2;
# print "x = $x\n";
 
 