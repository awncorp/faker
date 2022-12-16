package Faker::Plugin::JaJp::PersonLastKanaName;

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

  return $self->faker->random->select(data_for_last_name());
}

sub data_for_last_name {
  state $last_name = [
    'アオタ',
    'アオヤマ',
    'イシダ',
    'イダカ',
    'イトウ',
    'ウノ',
    'エコダ',
    'オオガキ',
    'カノウ',
    'カノウ',
    'キジマ',
    'キムラ',
    'キリヤマ',
    'クドウ',
    'コイズミ',
    'コバヤシ',
    'コンドウ',
    'サイトウ',
    'サカモト',
    'ササキ',
    'サトウ',
    'ササダ',
    'スズキ',
    'スギヤマ',
    'タカハシ',
    'タナカ',
    'タナベ',
    'ツダ',
    'ナカジマ',
    'ナカムラ',
    'ナギサ',
    'ナカツガワ',
    'ニシノソノ',
    'ノムラ',
    'ハラダ',
    'ハマダ',
    'ヒロカワ',
    'フジモト',
    'マツモト',
    'ミヤケ',
    'ミヤザワ',
    'ムラヤマ',
    'ヤマギシ',
    'ヤマグチ',
    'ヤマダ',
    'ヤマモト',
    'ヨシダ',
    'ヨシモト',
    'ワカマツ',
    'ワタナベ',
  ]
}

1;
