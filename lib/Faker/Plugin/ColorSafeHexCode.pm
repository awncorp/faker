package Faker::Plugin::ColorSafeHexCode;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $number = $self->faker->random->range(0, 255);

  return '#' . sprintf("ff00%02x", $number);
}

1;
