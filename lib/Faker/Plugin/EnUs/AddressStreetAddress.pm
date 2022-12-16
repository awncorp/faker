package Faker::Plugin::EnUs::AddressStreetAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->process_format(
      $self->faker->random->select(data_for_address_street_address())
    ),
    'newlines',
  );
}

sub data_for_address_street_address {
  state $address_street_address = [
    '{{address_number}} {{address_street_name}}',
    '{{address_number}} {{address_street_name}} {{address_line2}}',
    '{{address_number}} {{address_street_name}}\n{{address_line2}}',
  ]
}

1;
