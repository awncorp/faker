package Faker::Plugin::EsEs::AddressLine2;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_address_line2()),
    'numbers',
  );
}

sub data_for_address_line2 {
  state $address_line2 = [
    'Bajos',
    'Ático #º',
    'Entre suelo #º',
    'Bajo #º',
    '#º',
    '#º A',
    '#º B',
    '#º C',
    '#º D',
    '#º E',
    '#º F',
    '##º A',
    '##º B',
    '##º C',
    '##º D',
    '##º E',
    '##º F',
    '#º #º',
    '##º #º',
  ]
}

1;
