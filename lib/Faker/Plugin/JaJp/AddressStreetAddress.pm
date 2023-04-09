package Faker::Plugin::JaJp::AddressStreetAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_street_address())
  );
}

sub data_for_address_street_address {
  state $address_street_address = [
    '{{address_street_name}}{{person_last_name}}{{address_area_number}}-{{address_area_number}}-{{address_area_number}}',
  ]
}

1;
