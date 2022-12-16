package Faker::Plugin::JaJp::JargonAdverb;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.17';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_adverb());
}

sub data_for_jargon_adverb {
  state $jargon_adverb = [
    'アダプティブ',
    '高度',
    '改善した',
    '同化した',
    '自動化',
    'バランスの取れた',
    'ビジネス重視',
    '一元化された',
    '複製された',
    '互換性',
    '設定可能',
  ]
}

1;
