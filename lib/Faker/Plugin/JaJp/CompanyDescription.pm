package Faker::Plugin::JaJp::CompanyDescription;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $does = $self->faker->random->select([
    '配達します',
    '募集',
    '提供する',
  ]);

  return join '', $does,
    $self->faker->jargon_term_prefix,
    $self->faker->jargon_adverb,
    $self->faker->jargon_term_suffix;
}

1;
