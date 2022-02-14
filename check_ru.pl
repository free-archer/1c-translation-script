use strict;
use warnings;
use utf8;
use open qw(:std :utf8);
#use Data::Dumper::Simple;

my $filename;

if (scalar(@ARGV) != 0) {
    $filename = $ARGV[0];
}
else {
    $filename = 'Module.bsl';
}

print("Checks $filename");

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my $count = 0;
my $ind = 1;
while (my $line = <$fh>) {
    $ind++;
    if ($line =~ /[А-яёЁ]/g) {
        print "$ind  - $line";
        $count++;
    }
}

close($fh);

print ("Find $count lines with russian letters\n");
