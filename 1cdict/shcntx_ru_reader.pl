use strict;
use utf8;

use Data::Dumper::Simple;
use Win32::Console;
use Win32::Unicode::File;
Win32::Console::OutputCP( 65001 );

binmode(STDIN,':utf8');
binmode(STDOUT,':utf8');


my $filename = "shcntx_ru";
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @lines;
while (my $line = <$fh>) {
    push(@lines, $line);
}
close($fh);

my $newfilename = "dict.txt";
open(my $fw, '>:encoding(UTF-8)', $newfilename)
    or die "Could not open file '$newfilename' $!";

my $ru = "";
my $en = "";
foreach my $line (@lines) {
    # if ($line =~ /#&\^@\^%&\*\^#1"}$/) {
    #     next;
    # }

    $line =~ s/#&\^@\^%&\*\^#1//;

    if ($line =~ /^{"ru","(\w+)"}/) {
        $ru = $1;
        #print "$ru\n";

    }
    if ($line =~ /^{"en","(\w+)"}/) {
        $en = $1;
        #print "$en\n";
    }

    if ($ru ne "" && $en ne "") {
        print $fw "$ru - $en\n";
        $ru = "";
        $en = "";
    }
}
print("Done \n");
close($fw);

