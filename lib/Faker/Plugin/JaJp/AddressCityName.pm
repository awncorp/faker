package Faker::Plugin::JaJp::AddressCityName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_address_city_name())
  );
}

sub data_for_address_city_name {
  state $address_city_name = [
    '{{person_last_name}}{{address_city_suffix}}',
  ]
}

1;
