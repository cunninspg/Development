
my @servers = ('a', 'b' );
foreach $server (@servers)
{
        print $server;
}   



$a = "Hello World";
print "$a\n";

if ($a =~ "World")
{
    print "$a contains World\n";
}

$a =~ s/World/Earth/;
print "$a\n";


#
# Two options, chdir to TEMP directory
# OR check for files in TEMP/
#    but will have the Directory
#
# 
$TEMP="D:/Development/PerlScripts/TestCompact/data";
chdir $TEMP;
$file = "*.txt";
if ( -e $TEMP//$file ) {
  # for ( <*.txt> ) {
    # print $_  . "\n";
  # }
  # for ( <$TEMP\/$file> ) {
        # print $_  . "\n";
        # $_ =~ s/$TEMP\/// ;
         # print $_  . "\n";       
  # }
}
chdir ".." ;
if ( -e $TEMP//$file ) {
  for ( <$TEMP\/$file> ) {
        print $_  . "\n";
        #take the $TEMP off name
#        $_ =~ s/$TEMP\/// ;
#         print $_  . "\n";       
        open my $fh, '<', $_ or die "unable to open file";
        while (<$fh>)  {
                (  $var1,  $var2) = ($_ =~ /(\S+) (\S+)/);
        }
        print " var 1 = $var1 \n var 2 = $var2\n";
        close $fh;
         last;
  }
}

        open my $fh, '<', "$TEMP\/1-test1.txt" or die "unable to open file";
        while (<$fh>)  {
                (  $var1,  $var2) = ($_ =~ /(\S+) (\S+)/);
        }
        print " var 1 = $var1 \n var 2 = $var2\n";
        close $fh;

if ( -e $TEMP//$file ) {
  for ( <$TEMP\/$file> ) {
        print $_  ;
        $TMX = substr $_, -3;
        print " $TMX\n";
  } # end for    
}
    

