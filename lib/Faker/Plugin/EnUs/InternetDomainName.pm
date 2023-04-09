package Faker::Plugin::EnUs::InternetDomainName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return join '.',
    $self->faker->internet_domain_word,
    $self->faker->internet_domain_tld,
}

1;
