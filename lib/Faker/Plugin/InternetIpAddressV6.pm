package Faker::Plugin::InternetIpAddressV6;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $random = $self->faker->random;

  return join ':',
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535))),
    sprintf('%04s', sprintf("%02x", $random->range(0, 65535)));
}

1;
