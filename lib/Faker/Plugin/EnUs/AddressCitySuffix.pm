package Faker::Plugin::EnUs::AddressCitySuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_city_suffix());
}

sub data_for_address_city_suffix {
  state $address_city_suffix = [
    'town',
    'ton',
    'land',
    'ville',
    'berg',
    'burgh',
    'borough',
    'bury',
    'view',
    'port',
    'mouth',
    'stad',
    'furt',
    'chester',
    'mouth',
    'fort',
    'haven',
    'side',
    'shire',
  ]
}

1;
