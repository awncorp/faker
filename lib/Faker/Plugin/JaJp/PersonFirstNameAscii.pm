package Faker::Plugin::JaJp::PersonFirstNameAscii;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->select(data_for_first_name_ascii());
}

sub data_for_first_name_ascii {
  state $first_name_ascii = [
    'akira',
    'atsushi',
    'osamu',
    'akemi',
    'asuka',
    'kazuya',
    'kyosuke',
    'kenichi',
    'kaori',
    'kana',
    'kumiko',
    'shuhei',
    'shota',
    'jun',
    'soutaro',
    'sayuri',
    'satomi',
    'taichi',
    'taro',
    'takuma',
    'tsubasa',
    'tomoya',
    'chiyo',
    'naoki',
    'naoto',
    'naoko',
    'nanami',
    'hideki',
    'hiroshi',
    'hanako',
    'haruka',
    'manabu',
    'mitsuru',
    'minoru',
    'maaya',
    'mai',
    'mikako',
    'miki',
    'momoko',
    'yuki',
    'yuta',
    'yasuhiro',
    'youichi',
    'yosuke',
    'yui',
    'yumiko',
    'yoko',
    'ryosuke',
    'ryohei',
    'rei',
    'rika',
  ]
}

1;
