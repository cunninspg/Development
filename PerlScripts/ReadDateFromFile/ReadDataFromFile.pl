use TIE::File;

$myVar="\{AUTOSYS_DATE\}";
$myVar='$PY0021PayPeriodBegin';

$filename="d:/Development/PerlScripts/ReadDateFromFile/ReadDateFromFile.txt";

print "\$myVar contains: $myVar\n";

#and not -z $filename
if ( -e $filename ) {
	(-z $filename) and die "file is zero bytes - exit\n";
	print "Opening file $filenam \n";
	my @filedate;
	tie @filedate, "Tie::File", $filename;
	print "using date:$filedate[0] \n";
	$myVar = $filedate[0];
	untie @filedate;
	
}
else {
	print "No file: using $myVar\n";
}

printf("\n\n Doing stuff with date \n\n");
my $xml = '<soapenv:Envelope>
	<soapenv:Header/>
	<soapenv:Body>
		<flow:ParameterName>Pricess Start Date</flow:ParameterName>
		<flow:ParameterValue>$PY0021PayPeriodBegin</flow:ParameterName>
	</soapenv:Body>
</soapenv:Envelope>'; \
print "Before:\n$xml \n";

$xml =~ s/\$PY0021PayPeriodBegin/$myVar/;
print "After:\n$xml \n";
print "\n";
# Remove date from file
# or use DB to add one to date then update file
if ( -e $filename ) {
	(-z $filename) and die "file is zero bytes\n";
	print "Opening file $filenam \n";
	my @filedate;
	tie @filedate, "Tie::File", $filename;

	print "removing date:$filedate[0] \n";
	shift(@filedate);
# OR
#	my $newDate = "2000-01-01";
#	print "replacing $filedate[0] with $newDate\n";
#	$filedate[0] = $newDate;
	
	untie @filedate;
	
}

 #$filename =~ m/.txt/ && noFunctionHere && print "***error here***\n";
 