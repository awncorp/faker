package Faker::Plugin::PaymentCardAmericanExpress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_payment_card_american_express()),
    'numbers',
  );
}

sub data_for_payment_card_american_express {
  state $payment_card_american_express = [
    '34############',
    '37############',
  ]
}

1;
