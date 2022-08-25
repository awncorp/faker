package Faker::Plugin::InternetIpAddressV4;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $random = $self->faker->random;

  return join '.',
    $random->range(0, 255),
    $random->range(0, 255),
    $random->range(0, 255),
    $random->range(0, 255);
}

1;
