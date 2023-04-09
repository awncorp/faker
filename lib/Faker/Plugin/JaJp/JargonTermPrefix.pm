package Faker::Plugin::JaJp::JargonTermPrefix;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_jargon_term_prefix());
}

sub data_for_jargon_term_prefix {
  state $jargon_term_prefix = [
    '力を与える',
    '包括的',
    '平らな',
    'エグゼクティブ',
    '明示的',
    'にじみ出る',
    '耐障害性',
    '前景',
    '斬新な考え方',
    'フルレンジ',
    'グローバル',
  ]
}

1;
