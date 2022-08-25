package Faker::Plugin::LoremParagraph;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->lorem_sentences({
    count => $self->faker->random->range(3, 9),
  });
}

1;
