package Faker::Plugin::ColorRgbColorsetCss;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return sprintf 'rgb(%s)', join ', ', $self->faker->color_rgb_colorset;
}

1;
