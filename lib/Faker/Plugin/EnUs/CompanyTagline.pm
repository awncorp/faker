package Faker::Plugin::EnUs::CompanyTagline;

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

  return join ' ',
    $self->faker->jargon_verb,
    $self->faker->jargon_adjective,
    $self->faker->jargon_noun,
}

1;
