package Faker::Plugin::EsEs::AddressCityPrefix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_city_prefix());
}

sub data_for_address_city_prefix {
  state $address_city_prefix = [
    'San',
    'Vall',
    "L'",
    'Villa',
    'El',
    'Los',
    'La',
    'Las',
    'O',
    'A',
    'Os',
    'As',
  ]
}

1;
