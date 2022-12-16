package Faker::Plugin::JaJp::JargonNoun;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.15';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_noun());
}

sub data_for_jargon_noun {
  state $jargon_noun = [
    '相乗効果',
    'ウェブ対応',
    'パラダイム',
    '市場',
    'パートナーシップ',
    'インフラストラクチャ',
    'プラットフォーム',
    'イニシアチブ',
    'チャンネル',
    '眼球',
    'コミュニティ',
  ]
}

1;
