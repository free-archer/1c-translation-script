use strict;
use utf8;
use Data::Dumper::Simple;
use 5.010;

#my $filename = $ARGV[0];
my $filedict = "dict.txt";
open(my $fh, '<:encoding(UTF-8)', $filedict)
    or die "Could not open file '$filedict' $!";

my @dict;
while (my $line = <$fh>) {
    $line =~ /(^\w+) - (\w+)$/;

    my %rec = ();
    $rec{'ru'} = $1;
    $rec{'en'} = $2;

    push(@dict, \%rec);
}
close($fh);

#warn Dumper @dict;


my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @lines;
while (my $line = <$fh>) {
    push(@lines, $line);
}
close($fh);

my $doreplases = 0;
foreach my $reg (@dict) {
    foreach my $line (@lines) {
        unless ($line =~ /^\//) {
            my $old_line = $line;

	    my $ru = $reg->{ru};
	    my $en = $reg->{en};

	    $line =~ s/(?<![А-я])$ru(?![А-я])/$en/g;

            if ($line ne $old_line) {
#                print "$old_line -> $line";
                $doreplases++;
            }
        }
    }
}

my $filename_en = '';
if ($ARGV[1]) {
    $filename_en = $ARGV[1];    
} else {
    $filename_en = $filename;
}

open(my $fw, '>:encoding(UTF-8)', $filename_en) 
    or die "Could not open file '$filename' $!";

foreach my $line (@lines) {
    print $fw $line;
}
close($fw);

print "Done $doreplases replases \n"
