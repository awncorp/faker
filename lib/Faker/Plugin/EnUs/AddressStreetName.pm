package Faker::Plugin::EnUs::AddressStreetName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_street_name())
  );
}

sub data_for_address_street_name {
  state $address_street_name = [
    '{{person_first_name}} {{address_street_suffix}}',
    '{{person_last_name}} {{address_street_suffix}}',
  ]
}

1;
