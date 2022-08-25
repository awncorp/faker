package Faker::Plugin::LoremParagraphs;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $count = $data->{count} //= 2;

  return join "\n\n", map $self->faker->lorem_paragraph, 1..$count;
}

1;
