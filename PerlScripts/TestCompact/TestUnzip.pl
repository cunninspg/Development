 use IO::Uncompress::Unzip qw(unzip $UnzipError) ;

chdir "D:/Development/PerlScripts/TestCompact/data" or die "Error $!\n";
 
 $zipfile="output.zip";
 my $output ;


## unzip $zipfile or die "unzip failed: $UnzipError\n";

#unzip $zipfile => \$output, Name => "test1.txt" or die "unzip failed: $UnzipError\n";
#print $output;


#    my $input = "output.zip";
#    my $output = "*.txt";
#    unzip $input => $output
#        or die "unzip failed: $UnzipError\n";
        
        
        
    use IO::File ;
    my $input = new IO::File "<output.zip"
        or die "Cannot open 'file1.zip': $!\n" ;
    my $buffer ;
    unzip $input => \$buffer 
        or die "unzip failed: $UnzipError\n";
    print $buffer;
    
    $old_zip_file="output.zip";
chdir "D:/PerlScripts/TestCompact/data" or die "Error $!\n";
