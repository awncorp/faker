package Faker::Plugin::JaJp::PersonLastNameAscii;

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

  return $self->faker->random->select(data_for_last_name_ascii());
}

sub data_for_last_name_ascii {
  state $last_name_ascii = [
    'aota',
    'aoyama',
    'ishida',
    'idaka',
    'ito',
    'uno',
    'ekoda',
    'ogaki',
    'kato',
    'kanou',
    'kijima',
    'kimura',
    'kiriyama',
    'kudo',
    'koizumi',
    'kobayashi',
    'kondo',
    'saito',
    'sakamoto',
    'sasaki',
    'sato',
    'sasada',
    'suzuki',
    'sugiyama',
    'takahashi',
    'tanaka',
    'tanabe',
    'tsuda',
    'nakajima',
    'nakamura',
    'nagisa',
    'nakatsugawa',
    'nishinosono',
    'nomura',
    'harada',
    'hamada',
    'hirokawa',
    'fujimoto',
    'matsumoto',
    'miyake',
    'miyazawa',
    'murayama',
    'yamagishi',
    'yamaguchi',
    'yamada',
    'yamamoto',
    'yoshida',
    'yoshimoto',
    'wakamatsu',
    'watanabe',
  ]
}

1;
