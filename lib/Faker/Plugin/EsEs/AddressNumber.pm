package Faker::Plugin::EsEs::AddressNumber;

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

  return $self->process_markers(
    $self->faker->random->select(data_for_address_number()),
    'numbers',
  );
}

sub data_for_address_number {
  state $address_number = [
    '###',
    '##',
    '#',
  ]
}

1;
