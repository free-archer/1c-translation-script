use strict;
use utf8;
use Data::Dumper::Simple;
use feature qw(say);

# my %dict;

# $dict{ru} = "rus";
# $dict{en} = "english";

# print Dumper %dict;


my @arr = ('abc', 1);
 print Dumper @arr;
 say $arr[0];

my %hash = ('abc' => 123);
$hash{ru} = "rus1";
$hash{en} = "english";
say $hash{en};
print Dumper %hash;

push(@arr, \%hash);

print Dumper @arr;

say $arr[2];
say $arr[2]{ru};
say $arr[2]->{ru};

