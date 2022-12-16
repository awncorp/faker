package Faker::Plugin::JaJp::JargonAdjective;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_adjective());
}

sub data_for_jargon_adjective {
  state $jargon_adjective = [
    '直感的',
    '付加価値',
    '垂直',
    '先回り',
    '屈強',
    '革命的な',
    'スケーラブル',
    '最先端',
    '革新的な',
    '直感的',
    '戦略的',
  ]
}

1;
