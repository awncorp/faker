package Faker::Plugin::PaymentCardNumber;

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

  my $method = $data->{method} ||= $self->faker->random->select(
    data_for_payment_card_number()
  );

  return $self->faker->$method;
}

sub data_for_payment_card_number {
  state $payment_card_number = [
    map('payment_card_visa', 1..6),
    map('payment_card_mastercard', 1..3),
    map('payment_card_american_express', 1..2),
    'payment_card_discover',
  ]
}

1;
