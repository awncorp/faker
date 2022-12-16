package Faker::Plugin::JaJp::InternetDomainName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_internet_domain_name())
  );
}

sub data_for_internet_domain_name {
  state $internet_domain_name = [
    '{{internet_domain_word}}.{{internet_domain_tld}}',
  ]
}

1;
