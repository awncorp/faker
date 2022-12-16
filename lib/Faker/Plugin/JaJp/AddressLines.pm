package Faker::Plugin::JaJp::AddressLines;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_lines())
  );
}

sub data_for_address_lines {
  state $address_lines = [
    '{{address_line1}}',
    '{{address_line1}} {{address_line2}}',
  ]
}

1;
