package Faker::Plugin::ColorRgbColorsetCss;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return sprintf 'rgb(%s)', join ', ', $self->faker->color_rgb_colorset;
}

1;
