package Faker::Plugin::AddressLatitude;

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

  my $random = $self->faker->random;

  my $string = $random->select(
    [int($random->pick(90000000)), int($random->pick(-90000000))]
  );

  $string =~ s/\d*(\d\d)(\d{6})$/$1.$2/;

  return $string;
}

1;
