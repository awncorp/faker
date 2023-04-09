package Faker::Plugin::JaJp::PersonFirstKanaName;

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

  return (lc($self->faker->person_gender) eq 'male')
    ? $self->faker->random->select(data_for_first_kana_name_male())
    : $self->faker->random->select(data_for_first_kana_name_female());
}

sub data_for_first_kana_name_male {
  state $first_kana_name = [
    'アキラ',
    'アツシ',
    'オサム',
    'カズヤ',
    'キョウスケ',
    'ケンイチ',
    'シュウヘイ',
    'ショウタ',
    'ジュン',
    'ソウタロウ',
    'タイチ',
    'タロウ',
    'タクマ',
    'ツバサ',
    'トモヤ',
    'ナオキ',
    'ナオト',
    'ヒデキ',
    'ヒロシ',
    'マナブ',
    'ミツル',
    'ミノル',
    'ユウキ',
    'ユウタ',
    'ヤスヒロ',
    'ヨウイチ',
    'ヨウスケ',
    'リョウスケ',
    'リョウヘイ',
    'レイ',
  ]
}

sub data_for_first_kana_name_female {
  state $first_kana_name = [
    'アケミ',
    'アスカ',
    'カオリ',
    'カナ',
    'クミコ',
    'サユリ',
    'サトミ',
    'チヨ',
    'ナオコ',
    'ナナミ',
    'ハナコ',
    'ハルカ',
    'マアヤ',
    'マイ',
    'ミカコ',
    'ミキ',
    'モモコ',
    'ユイ',
    'ユミコ',
    'ヨウコ',
    'リカ',
  ]
}

1;
