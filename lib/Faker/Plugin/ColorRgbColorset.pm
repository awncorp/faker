package Faker::Plugin::ColorRgbColorset;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $color = $self->faker->color_hex_code;

  my $colorset = [
    hex(substr($color, 1, 2)),
    hex(substr($color, 3, 2)),
    hex(substr($color, 5, 2)),
  ];

  return wantarray ? (@$colorset) : $colorset;
}

1;
