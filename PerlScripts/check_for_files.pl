use File::Copy;

$IN_DIR="D:/\Development\/PerlScripts/\data/\in";
$OUT_DIR="D:/\Development\/PerlScripts/\data\/out";

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

############################################################
# rename worked to move a file
# copy() and move() only worked when adding the following
#             use File::Copy;
############################################################
printf("========== Test 5 ==========\n");
my @files = (
  "012.EXP",
  "012B.exp",
  "123.exp",
  "fi1.EXP",
  "fi2 .EXP",
  "file 3.EXP.EXP",
  "I do not exist"
);

foreach my $file (@files) {
	if ( -e $file ) {
		printf("%s\n", $file);
# OK		copy ($file, $OUT_DIR);
# OK		move ($file, $OUT_DIR);
# OK		rename "$file", "$OUT_DIR/$file";
		copy ($file, "$OUT_DIR\/$file");
		exit;
	}
}