These are test files to check filenames 

#ok 

my @files = glob("\[A-Z0-9\]\[A-Z0-9\]\[A-Z0-9\]\.exp");
#notok my @files = glob("\[A-Z0-9\]\{3\}.exp");

foreach my $file (@files) {
	printf("%s\n", $file);
}