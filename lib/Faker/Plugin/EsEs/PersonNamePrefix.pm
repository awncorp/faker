package Faker::Plugin::EsEs::PersonNamePrefix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return lc($self->faker->person_gender) eq 'male'
    ? $self->faker->random->select(data_for_name_prefix_male())
    : $self->faker->random->select(data_for_name_prefix_female());
}

sub data_for_name_prefix_male {
  state $name_prefix = [
    'Señor',
  ]
}

sub data_for_name_prefix_female {
  state $name_prefix = [
    'Señora',
    'Señorita',
  ]
}

1;
