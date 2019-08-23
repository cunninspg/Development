use IO::Uncompress::Unzip qw(unzip $UnzipError) ;
# 
# Unzip Artifact
#
$zip_file="output.zip";
chdir "D:/Development/PerlScripts/TestCompact/data" or die "Error $!\n";

$unzip_directory=".";

my $zip_fh = new IO::Uncompress::Unzip  $zip_file
    or die qq(Cannot open zip "$zip_file" for reading.);
#
# Go through each element in Zip file
#
my $status = 1;
while ( $status ) {
    
    if ( $status < 0 ) {
        die qq(Error in Zip: $IO::Uncompress::Unzip::UnzipError.);
    }
    #
    # Get name of the file you're unzipping in the zip
    #
    my $element_name = $zip_fh->getHeaderInfo->{Name};
    next if $element_name =~ m{/$};      # Skip Directories
print ("element name = $element_name\n");

    my $element_dir = dirname $element_name;
    my $full_element_dir = File::Spec->join( $unzip_directory, $element_dir );
    print "Full element dir: $full_element_dir \n";  
    die;  
    #
    # Create the directory for the file if it doesn't exist
    #
    
    my $full_element_name = File::Spec->join( $unzip_directory, $element_name );
    print "Full element name: $full_element_name \n";
    
    if ( not -d $full_element_dir ) {
        make_path $full_element_dir
            or die qq(Can't make directory "$full_element_dir".);
    }
    my $unzipped_fh = IO::File->new( $full_element_name, "w" )
        or die qq(Can't open file "$full_element_name" for writing: $!);
    #
    # Now repeatably read the file until you've written everything
    #
    my $buffer;
    while ( $status = $zip_fh->read( $buffer ) ) {
        if ( $status < 0 ) {
            die qq(Error in Zip: $IO::Uncompress::Unzip::UnzipError.);
        }
        $unzipped_fh->write( $buffer );
    }
    $unzipped_fh->close;

    $status = $zip_fh->nextStream; # Getting next file if any... or 0 to quit loop...
}
$zip_fh->close;