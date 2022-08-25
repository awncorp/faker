package Faker::Plugin::LoremSentences;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $count = $data->{count} //= 5;

  return join ' ', map $self->faker->lorem_sentence, 1..$count;
}

1;
