package Faker::Plugin::JaJp::AddressAreaNumber;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->range(1, 10);
}

1;
