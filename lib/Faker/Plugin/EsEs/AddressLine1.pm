package Faker::Plugin::EsEs::AddressLine1;

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
    $self->faker->random->select(data_for_address_line1())
  );
}

sub data_for_address_line1 {
  state $address_line1 = [
    '{{address_street_address}}, {{address_postal_code}}, {{address_city_name}}',
  ]
}

1;
