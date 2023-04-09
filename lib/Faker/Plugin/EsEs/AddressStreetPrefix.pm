package Faker::Plugin::EsEs::AddressStreetPrefix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_street_prefix());
}

sub data_for_address_street_prefix {
  state $address_street_prefix = [
    'Calle',
    'Avenida',
    'Plaza',
    'Paseo',
    'Ronda',
    'Travesía',
    'Camino',
    'Carrer',
    'Avinguda',
    'Plaça',
    'Passeig',
    'Travessera',
    'Rúa',
    'Praza',
    'Ruela',
    'Camiño',
  ]
}

1;
