# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..11\n"; }
END {print "not ok 1\n" unless $loaded;}
use override;
$loaded = 1;
print "ok 1\n";

sub ok {
  my( $number, $value ) = @_;
  print $value ? "ok $number\n" : "not ok $number\n";
}

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

use override length => sub { scalar @_ };
ok( 2, length( 1, 2, 3 ) == 3 );
ok( 3, length( 'Casey' ) == 1 );

no override 'length';
ok( 4, length( 'Casey' ) == 5 );


use override values => sub { values %{{ @_ }} };
my %vals = qw(5 5 6 6 7 7);
foreach ( sort { $a <=> $b } values( qw(One 5 Two 6 Three 7) ) ) {
  ok( $_, $_ == $vals{$_} );
}
no override 'values';

use override lc => sub { 'hi' },
             uc => sub { 'hi' };

ok( 8, lc('HELLO') eq 'hi' );
ok( 9, uc('hello') eq 'hi' );

no override;

ok( 10, lc('HELLO') eq 'hello' );
ok( 11, uc('hello') eq 'HELLO' );

