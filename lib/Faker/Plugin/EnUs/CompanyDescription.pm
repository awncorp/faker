package Faker::Plugin::EnUs::CompanyDescription;

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

  my $does = $self->faker->random->select([
    'Delivers',
    'Delivering',
    'Excels at',
    'Offering',
    'Best-in-class for',
    'Provides',
    'Providing',
  ]);

  return join ' ', $does,
    $self->faker->jargon_term_prefix,
    $self->faker->jargon_adverb,
    $self->faker->jargon_term_suffix;
}

1;
