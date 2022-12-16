package Faker::Plugin::EsEs::CompanyName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_format(
    $self->faker->random->select(format_for_company_name())
  );
}

sub format_for_company_name {
  state $name = [
    '{{company_name_prefix}} {{person_last_name}} {{company_name_suffix}}',
    '{{company_name_prefix}} {{person_last_name}}',
    '{{company_name_prefix}} {{person_last_name}}-{{person_last_name}}',
    '{{person_last_name}}-{{person_last_name}} {{company_name_suffix}}',
    '{{person_last_name}} y {{person_last_name}} {{company_name_suffix}}',
    '{{person_last_name}} de {{person_last_name}} {{company_name_suffix}}',
    '{{person_last_name}}, {{person_last_name}} y {{person_last_name}} {{company_name_suffix}}',
    '{{person_last_name}}-{{person_last_name}}',
    '{{person_last_name}} y {{person_last_name}}',
    '{{person_last_name}} de {{person_last_name}}',
  ]
}

1;
