package Faker::Plugin::JaJp::AddressCitySuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_city_suffix());
}

sub data_for_address_city_suffix {
  state $address_city_suffix = [
    '市'
  ]
}

1;
