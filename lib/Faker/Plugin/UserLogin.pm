package Faker::Plugin::UserLogin;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->process_format($self->faker->random->select(format_for_username()))
  );
}

sub format_for_username {
  state $name = [
    '{{person_last_name}}.{{person_first_name}}',
    '{{person_first_name}}.{{person_last_name}}',
    '{{person_first_name}}##',
    '{{person_first_name}}####',
    '?{{person_last_name}}',
    '?{{person_last_name}}####',
  ]
}

1;
