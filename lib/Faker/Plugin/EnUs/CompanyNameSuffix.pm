package Faker::Plugin::EnUs::CompanyNameSuffix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_name_suffix());
}

sub data_for_name_suffix {
  state $name = [
    'Co.',
    'Consulting',
    'Electronics',
    'Entertainment',
    'Inc.',
    'Incorporated',
    'and Sons',
    'LLC',
    'Group',
    'PLC',
    'Ltd.',
    'Ventures',
    'Worldwide',
    'Pty.',
  ]
}

1;
