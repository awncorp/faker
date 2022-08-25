package Faker::Plugin::LoremSentence;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->lorem_words({
    count => $self->faker->random->range(6, 20),
  }) . '.';
}

1;
