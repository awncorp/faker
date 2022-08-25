package Faker::Plugin::SoftwareAuthor;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(format_for_software_author())
  );
}

sub format_for_software_author {
  state $software_author = [
    map([
      '{{person_name}}'
    ], 1..3),
    [
      '{{company_name}}',
    ],
  ]
}

1;
