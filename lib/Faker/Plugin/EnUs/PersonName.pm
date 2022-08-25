package Faker::Plugin::EnUs::PersonName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format($self->faker->random->select(format_for_name()));
}

sub format_for_name {
  state $name = [
    map([
      '{{person_first_name}}',
      '{{person_last_name}}'
    ], 1..3),
    [
      '{{person_first_name}}',
      '{{person_first_name}}',
      '{{person_last_name}}'
    ],
  ]
}

1;
