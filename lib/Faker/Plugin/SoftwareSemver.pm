package Faker::Plugin::SoftwareSemver;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_software_semver()),
    'numbers',
  );
}

sub data_for_software_semver {
  state $software_semver = [
    '0.#.#',
    '#.#.#',
    '#.##.##',
  ]
}

1;
