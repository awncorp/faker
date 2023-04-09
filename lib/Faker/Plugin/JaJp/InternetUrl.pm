package Faker::Plugin::JaJp::InternetUrl;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(data_for_internet_url())
  );
}

sub data_for_internet_url {
  state $internet_url = [
    'https://www.{{internet_domain_name}}/',
    'https://{{internet_domain_name}}/',
    'http://www.{{internet_domain_name}}/',
    'http://{{internet_domain_name}}/',
    'http://{{internet_domain_name}}/',
  ]
}

1;
