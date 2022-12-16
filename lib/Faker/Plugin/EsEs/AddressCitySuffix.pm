package Faker::Plugin::EsEs::AddressCitySuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_address_city_suffix());
}

sub data_for_address_city_suffix {
  state $address_city_suffix = [
    'del Vallès',
    'del Penedès',
    'del Bages',
    'de Ulla',
    'de Lemos',
    'del Mirador',
    'de Arriba',
    'de la Sierra',
    'del Barco',
    'de San Pedro',
    'del Pozo',
    'del Puerto',
    'de las Torres',
    'Alta',
    'Baja',
    'Medio',
  ]
}

1;
