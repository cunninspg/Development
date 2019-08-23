use IO::Compress::Zip qw(zip $ZipError) ;
 
chdir "D:/Development/PerlScripts/TestCompact/data" or die "Error $!\n";


foreach my $filename ( glob("*.txt")) {
 print " to be zipped $filename\n";
 ## system("compress $filename >data.log");
 
}
my $outfile="output.zip";
my @files = <*.txt>;
zip \@files => $outfile, BinModeIn => 1   or die "1 zip failed: $ZipError\n";

$outfile="output2.zip";
#zip [ <*.txt> ] => 'output2.zip', BinModeIn => 1  or die "zip2 failed: $ZipError\n";
zip [ <*.txt> ] => $outfile, BinModeIn => 1  or die "zip2 failed: $ZipError\n";


my $mask="*.txt";
$outfile="output3.zip";
@files=glob("$mask");
#zip \@files => 'output3.zip', BinModeIn => 1  or die "zip3 failed: $ZipError\n";
zip \@files => $outfile, BinModeIn => 1  or die "zip3 failed: $ZipError\n";

# did not create a zip file
# $outfile="output4.zip";
# system("mkdir $outfile >data.log");
# system("compact $outfile >>data.log");
# foreach my $filename ( glob("*.txt")) {
#     print " to be zipped $filename\n";
#     system("copy $filename $outfile >>data.log");
#  
# }
# system("compact $outfile >>data.log");