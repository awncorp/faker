package Faker::Plugin::EsEs::AddressStreetAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_street_address())
  );
}

sub data_for_address_street_address {
  state $address_street_address = [
    '{{address_street_name}}, {{address_number}}, {{address_line2}}',
  ]
}

1;
