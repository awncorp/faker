package Faker::Plugin::EnUs::AddressLine1;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_line1())
  );
}

sub data_for_address_line1 {
  state $address_line1 = [
    '{{address_number}} {{address_street_name}}'
  ]
}

1;
