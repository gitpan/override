package GlobalOverride;

use override GLOBAL_length => sub { length( join '', @_ ) };

sub goodlength {
  no override 'GLOBAL_length';
  length( $_[0] );
}

1;
