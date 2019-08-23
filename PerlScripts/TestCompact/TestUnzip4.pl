
    use IO::Uncompress::Unzip qw($UnzipError);

    # We would already be in the directory
    chdir "D:/Development/PerlScripts/TestCompact/data" or die "Error $!\n";
    
    
    my $zipfile = "output.zip";
    my $u = new IO::Uncompress::Unzip $zipfile
        or die "Cannot open $zipfile: $UnzipError";
    my $status;
    for ($status = 1; $status > 0; $status = $u->nextStream())
    {
 
        my $name = $u->getHeaderInfo()->{Name};
        warn "Processing member $name\n" ;
        my $buff;
#        while (($status = $u->read($buff)) > 0) {
#            # Do something here
#            print $buff
#        }

        # this worked, however data is one line
        $u->unzip($name) or die "error creating file $status $UnzipError"; 
#print "unzip status $status UnzipError $UnzipError\n";

        last if $status < 0;
    }
    die "Error processing $zipfile: $!\n"
        if $status < 0 ;