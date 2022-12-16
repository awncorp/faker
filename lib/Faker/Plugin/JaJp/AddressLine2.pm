package Faker::Plugin::JaJp::AddressLine2;

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
    $self->faker->random->select(data_for_address_line2())
  );
}

sub data_for_address_line2 {
  state $address_line2 = [
    'ハイツ{{person_last_name}}{{address_number}}号',
    'コーポ{{person_last_name}}{{address_number}}号',
  ]
}

1;
