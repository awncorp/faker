package Faker::Plugin::EnUs::AddressRegionName;

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

  my $method = $self->faker->random->bit ? 'address_state_name' : 'address_state_abbr';

  return $self->faker->$method;
}

1;
