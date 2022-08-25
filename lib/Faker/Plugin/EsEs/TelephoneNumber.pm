package Faker::Plugin::EsEs::TelephoneNumber;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $method = $self->faker->random->select(
    [
      'data_for_telephone_number',
      'data_for_telephone_number_mobile',
      'data_for_telephone_number_tollfree'
    ]
  );

  return $self->process_markers(
    $self->faker->random->select($self->$method),
    'numbers'
  );
}

sub data_for_telephone_number {
  state $telephone_number = [
    '+34 9## ## ####',
    '+34 9## ######',
    '+34 9########',
    '+34 9##-##-####',
    '+34 9##-######',
    '9## ## ####',
    '9## ######',
    '9########',
    '9##-##-####',
    '9##-######',
  ]
}

sub data_for_telephone_number_mobile {
  state $telephone_number = [
    '+34 6## ## ####',
    '+34 6## ######',
    '+34 6########',
    '+34 6##-##-####',
    '+34 6##-######',
    '6## ## ####',
    '6## ######',
    '6########',
    '6##-##-####',
    '6##-######',
  ]
}

sub data_for_telephone_number_tollfree {
  state $telephone_number = [
    '900 ### ###',
    '800 ### ###',
  ]
}

1;
