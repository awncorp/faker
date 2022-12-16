package Faker::Plugin::EnUs::PersonFormalName;

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

  return $self->process_format($self->faker->random->select(format_for_name()));
}

sub format_for_name {
  state $name = [
    map([
      '{{person_first_name}}',
      '{{person_last_name}}'
    ], 1..6),
    [
      '{{person_name_prefix}}',
      '{{person_first_name}}',
      '{{person_last_name}}'
    ],
    [
      '{{person_first_name}}',
      '{{person_last_name}}',
      '{{person_name_suffix}}'
    ],
    [
      '{{person_first_name}}',
      '{{person_first_name}}',
      '{{person_last_name}}',
      '{{person_name_suffix}}'
    ],
    [
      '{{person_name_prefix}}',
      '{{person_first_name}}',
      '{{person_first_name}}',
      '{{person_last_name}}',
      '{{person_name_suffix}}',
    ],
    [
      '{{person_name_prefix}}',
      '{{person_first_name}}',
      '{{person_last_name}}',
      '{{person_name_suffix}}',
    ]
  ]
}

1;
