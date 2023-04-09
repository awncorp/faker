package Faker::Plugin::EnUs::AddressCityPrefix;

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

  return $self->faker->random->select(data_for_address_city_prefix());
}

sub data_for_address_city_prefix {
  state $address_city_prefix = [
    'North',
    'East',
    'West',
    'South',
    'New',
    'Lake',
    'Port',
  ]
}

1;
