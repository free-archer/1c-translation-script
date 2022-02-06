use strict;
use utf8;

use Data::Dumper::Simple;
use Win32::Console;
use Win32::Unicode::File;
Win32::Console::OutputCP( 65001 );

binmode(STDIN,':utf8');
binmode(STDOUT,':utf8');


my $filename = "dict.txt";
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @dict;
while (my $line = <$fh>) {
    push(@dict, $line);
}
close($fh);

sub uniq {
    my %seen;
    grep(!$seen{$_}++, @_);
}

my @cutdict = uniq(@dict);

my $newfilename = "dict.txt";
#my $newfilename = $filename;
open(my $fw, '>:encoding(UTF-8)', $newfilename)
    or die "Could not open file '$newfilename' $!";

foreach my $line (@cutdict) {
    print $fw $line;
}
close($fw);

print("Done \n")


