package Faker::Plugin::PaymentCardDiscover;

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
    $self->faker->random->select(data_for_payment_card_discover()),
    'numbers',
  );
}

sub data_for_payment_card_discover {
  state $payment_card_discover = [
    '6011###########',
  ]
}

1;
