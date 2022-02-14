use strict;
use warnings;
use utf8;
use open qw(:std :utf8);

my $param1 = @ARGV;
my $filename;

if ($param1) {
    $filename = chomp($param1);
}
else {
    $filename = 'Module.bsl';
}

open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my $count = 0;
my $ind = 1;
while (my $line = <$fh>) {
    ind++;
    if ($line =~ /[А-яёЁ]/g) {
        print "$ind  - $line\n";
        $count++;
    }
}

close($fh);

print ("Find $count lines with russian letters\n");
