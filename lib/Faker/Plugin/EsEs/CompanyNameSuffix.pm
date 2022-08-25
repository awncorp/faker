package Faker::Plugin::EsEs::CompanyNameSuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_company_name_suffix());
}

sub data_for_company_name_suffix {
  state $name = [
    'e Hijo',
    'e Hija',
    'e Hijos',
    'y Asoc.',
    'y Flia.',
    'SRL',
    'SA',
    'S. de H.',
  ]
}

1;
