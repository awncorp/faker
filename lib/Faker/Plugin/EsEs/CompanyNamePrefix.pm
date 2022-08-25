package Faker::Plugin::EsEs::CompanyNamePrefix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_company_name_prefix());
}

sub data_for_company_name_prefix {
  state $name = [
    'Asociación',
    'Centro',
    'Corporación',
    'Empresa',
    'Gestora',
    'Global',
    'Grupo',
    'Viajes',
    'Air',
  ]
}

1;
