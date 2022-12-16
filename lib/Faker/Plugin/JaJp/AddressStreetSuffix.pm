package Faker::Plugin::JaJp::AddressStreetSuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_street_suffix());
}

sub data_for_address_street_suffix {
  state $address_street_suffix = [
    '町'
  ]
}

1;
