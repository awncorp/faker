package Faker::Plugin::JaJp::AddressWard;

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
    $self->faker->random->select(data_for_address_ward())
  );
}

sub data_for_address_ward {
  state $address_ward = [
    '中央',
    '北',
    '東',
    '南',
    '西',
  ]
}

1;
