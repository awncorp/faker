package Faker::Plugin::SoftwareVersion;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_software_version()),
    'numbers',
  );
}

sub data_for_software_version {
  state $software_version = [
    '#.##',
    '#.#',
    '#.#.#',
    '0.##',
    '0.#.#',
  ]
}

1;
