package Faker::Plugin::EnUs::PersonNameSuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return lc($self->faker->person_gender) eq 'male'
    ? $self->faker->random->select(data_for_name_suffix_male())
    : $self->faker->random->select(data_for_name_suffix());
}

sub data_for_name_suffix {
  state $name_suffix = [
    'MD',
    'DDS',
    'PhD',
    'DVM',
  ]
}

sub data_for_name_suffix_male {
  state $name_suffix = [
    data_for_name_suffix(),
    'Jr.',
    'Sr.',
    'I',
    'II',
    'III',
    'IV',
    'V',
  ]
}

1;
