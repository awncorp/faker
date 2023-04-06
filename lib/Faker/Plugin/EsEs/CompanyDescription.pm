package Faker::Plugin::EsEs::CompanyDescription;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $does = $self->faker->random->select([
    'Entrega',
    'Entregando',
    'Sobresale en',
    'Ofrecimiento',
    'Proporciona',
    'Proporcionar',
  ]);

  return join ' ', $does,
    $self->faker->jargon_term_prefix,
    $self->faker->jargon_adverb,
    $self->faker->jargon_term_suffix;
}

1;
