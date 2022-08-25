package Faker::Plugin::EnUs::AddressPostalCode;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_address_postal_code()),
    'numbers',
  );
}

sub data_for_address_postal_code {
  state $address_postal_code = [
    '#####',
    '#####-####',
  ]
}

1;
