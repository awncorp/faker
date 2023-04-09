package Faker::Plugin::JaJp::PersonKanaName;

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

  return $self->process_format($self->faker->random->select(format_for_name()));
}

sub format_for_name {
  state $name = [
    [
      '{{person_last_kana_name}}',
      '{{person_first_kana_name}}',
    ],
  ]
}

1;
