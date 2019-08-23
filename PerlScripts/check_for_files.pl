$IN_DIR="D:/\Development\/PerlScripts/\data/\in";

($mon, $year) = (localtime)[4, 5];

printf("%s %s\n", $mon, $year);
++$mon;
$year += 1900;
printf("%s %s\n", $mon, $year);
printf("=======================\n");
chdir $IN_DIR;
print "$IN_DIR\n";

#my $f="^[a-zA-Z0-0]*.EXP$";
#my $f='^[a-zA-Z0-0]*.EXP$';
#print "$f \n";

my @files = glob("\[A-Z0-9\]\[A-Z0-9\]\[A-Z0-9\]\.exp");
#notok my @files = glob("\[A-Z0-9\]\{3\}.exp");
foreach my $file (@files) {
	printf("%s\n", $file);
}
my $filter="[A-Z0-9][A-Z0-9][A-Z0-9].exp";
if (<$IN_DIR/$filter>) {
	printf("WE HAVE FILES\n");
}
my $filter="[A-Z0-9][A-Z0-9][A-Z0-9].exp";
if (<$IN_DIR/[A-Z0-9][A-Z0-9][A-Z0-9].exp>) {
	printf("WE HAVE FILES\n");
}
my @files = glob($filter);
#notok my @files = glob("\[A-Z0-9\]\{3\}.exp");
foreach my $file (@files) {
	printf("%s\n", $file);
}

printf("========== Test 4 ==========\n");
my $filter="[A-Z0-9][A-Z0-9][A-Z0-9].exp";
my $filter2="[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9].exp";
if (<$IN_DIR/$filter>|<$IN_DIR/$filter2> ) {
	printf("WE HAVE FILES\n");
}
my @files = glob( "{$filter,$filter2}");
foreach my $file (@files) {
	printf("%s\n", $file);
}