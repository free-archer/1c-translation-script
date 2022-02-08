use strict;
use warnings;
use utf8;
use open qw(:std :utf8);
#use Data::Dumper::Simple;
#use 5.010;

#get parameters
my ($param1, $param2) = @ARGV;

my $filename;
my $filename_en;
if ($param1) {
    if ($param1 eq "-i") {
        print "Enter full-path to a module what you will plan to translate:\n";
        $filename = <STDIN>;
        chomp($filename);
        $filename_en = $filename;
    }
    else {
        $filename = $param1;
        if ($param2) {
            $filename_en = $ARGV[1];
        }
        else {
            $filename_en = $filename;
        }
    }
}
else {
    $filename = 'Module.bsl';
    $filename_en = 'Module-en2.bsl';
}

print "The source file: $filename\n";
print "The result file: $filename_en\n";

print "In process ... \n";

my $filedict = "dict.txt";
open(my $fhdict, '<:encoding(UTF-8)', $filedict)
    or die "Could not open file '$filedict' $!";

my @dict;
while (my $line = <$fhdict>) {
    if($line =~ /^#/){
        next;
    }
    $line =~ /(^\w+) - (\w+)$/;

    my %rec = ();
    $rec{'ru'} = $1;
    $rec{'en'} = $2;

    push(@dict, \%rec);
}
close($fhdict);
#exit;
#warn Dumper @dict;

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

	    #$line =~ s/(?<![А-я])$ru(?![А-я])/$en/g;
        $line =~ s/\b$ru\b/$en/g;
        #$line =~ s/(?<=[^А-яёЁ]|^)$ru(?=[^А-яёЁ]|$)/$en/g;

            if ($line ne $old_line) {
                #print "$old_line -> $line";
                $doreplases++;
               #
            }
        }
    }
}

open(my $fw, '>:encoding(UTF-8)', $filename_en)
    or die "Could not open file '$filename' $!";

foreach my $line (@lines) {
    print $fw $line;
}
close($fw);

print "Done $doreplases replaces \n"
