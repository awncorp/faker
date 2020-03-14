package Faker::Plugin::InternetDomainWord;

use 5.014;

use strict;
use warnings;

use registry;
use routines;

use Data::Object::Class;
use Data::Object::ClassHas;

extends 'Data::Object::Plugin';

# VERSION

# ATTRIBUTES

has 'faker' => (
  is => 'ro',
  isa => 'InstanceOf["Faker"]',
  req => 1,
);

# METHODS

method execute() {
  my $faker = $self->faker;
  my $company = lc $faker->company_name;

  $company =~ s/\W+/-/g;
  $company =~ s/^\W+|\W+$//g;

  return $company;
}

1;
