package Faker::Plugin::EsEs::InternetDomainTld;

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

  return $self->faker->random->select(data_for_internet_domain_tld());
}

sub data_for_internet_domain_tld {
  state $internet_domain_tld = [
    'com',
    'com',
    'com',
    'com',
    'net',
    'org',
    'org',
    'es',
    'es',
    'es',
    'com.es',
  ]
}

1;
