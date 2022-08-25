package Faker::Plugin::PaymentCardVisa;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->process_markers(
    $self->faker->random->select(data_for_payment_card_visa()),
    'numbers',
  );
}

sub data_for_payment_card_visa {
  state $payment_card_visa = [
    '4539########',
    '4539###########',
    '4556########',
    '4556###########',
    '4916########',
    '4916###########',
    '4532########',
    '4532###########',
    '4929########',
    '4929###########',
    '40240071####',
    '40240071#######',
    '4485########',
    '4485###########',
    '4716########',
    '4716###########',
    '4###########',
    '4##############',
  ]
}

1;
