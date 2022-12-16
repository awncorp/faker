package Faker::Plugin::PaymentVendor;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_payment_vendor());
}

sub data_for_payment_vendor {
  state $payment_vendor = [
    'Visa',
    'Visa',
    'Visa',
    'Visa',
    'Visa',
    'MasterCard',
    'MasterCard',
    'MasterCard',
    'MasterCard',
    'MasterCard',
    'American Express',
    'Discover Card',
  ]
}

1;
