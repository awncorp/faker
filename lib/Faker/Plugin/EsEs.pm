package Faker::Plugin::EsEs;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.15';

# MODIFIERS

sub new {
  my ($self, @args) = @_;

  $self = $self->SUPER::new(@args);

  require Faker;

  my $caches = $self->faker->caches;

  $self->faker(Faker->new('es-es'));

  $self->faker->caches($caches) if $caches->count;

  return $self;
}

1;
