package Faker::Plugin::ColorHexCode;

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

  my $number = $self->faker->random->range(1, 16777215);

  return '#' . sprintf('%06s', sprintf('%02x', $number));
}

1;
