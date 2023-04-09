package Faker::Plugin::JaJp::InternetEmailDomain;

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

  return $self->faker->random->select(data_for_internet_email_domain());
}

sub data_for_internet_email_domain {
  state $internet_email_domain = [
    'gmail.com',
    'yahoo.co.jp',
    'hotmail.co.jp',
    'mail.goo.ne.jp',
  ]
}

1;
