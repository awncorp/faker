package Faker::Plugin::ColorSafeName;

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

  return $self->faker->random->select(data_for_color_safe_name());
}

sub data_for_color_safe_name {
  state $color_safe_name = [
    'black',
    'maroon',
    'green',
    'navy',
    'olive',
    'purple',
    'teal',
    'lime',
    'blue',
    'silver',
    'gray',
    'yellow',
    'fuchsia',
    'aqua',
    'white',
  ]
}

1;
