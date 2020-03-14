package Faker::Plugin::InternetEmailAddress;

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

  my $email_address = $faker->process(['internet', 'email']);

  $email_address =~ s/[^\w\.\@]+/-/g;
  $email_address =~ s/[^\w\.\@]+$//;

  return lc $email_address;
}

1;
