package Faker::Plugin::JaJp::CompanyNamePrefix;

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

  return $self->faker->random->select(data_for_company_name_prefix());
}

sub data_for_company_name_prefix {
  state $name = [
    '株式会社',
    '有限会社',
  ]
}

1;
