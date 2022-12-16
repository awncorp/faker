package Faker::Plugin::EnUs::AddressLine2;

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
    $self->faker->random->select(data_for_address_line2()),
    'letters',
    'numbers',
  );
}

sub data_for_address_line2 {
  state $address_line2 = [
    'Apt. ###',
    'Apt. ###',
    'Apt. ##',
    'Apt. #',
    'Mailbox ####',
    'Mailbox ###',
    'Suite ###',
    'Suite ##',
    'Suite #',
    'Unit ###',
    'Unit ##',
    'Unit #',
  ]
}

1;
