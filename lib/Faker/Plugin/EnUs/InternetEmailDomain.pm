package Faker::Plugin::EnUs::InternetEmailDomain;

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

  return $self->faker->random->select(data_for_internet_email_domain());
}

sub data_for_internet_email_domain {
  state $internet_email_domain = [
    'gmail.com',
    'hotmail.com',
    'icloud.com',
    'outlook.com',
    'proton.me',
    'yahoo.com',
  ]
}

1;
