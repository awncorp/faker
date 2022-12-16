package Faker::Plugin::JaJp::JargonVerb;

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

  return $self->faker->random->select(data_for_jargon_verb());
}

sub data_for_jargon_verb {
  state $jargon_verb = [
    '埋め込む',
    '利用する',
    '統合',
    '流線型',
    '最適化',
    '進化',
    '変身',
    '擁する',
    '有効',
    'オーケストレーションする',
    'てこの作用',
  ]
}

1;
