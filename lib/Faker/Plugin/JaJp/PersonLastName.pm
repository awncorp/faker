package Faker::Plugin::JaJp::PersonLastName;

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

  return $self->faker->random->select(data_for_last_name());
}

sub data_for_last_name {
  state $last_name = [
    '青田',
    '青山',
    '石田',
    '井高',
    '伊藤',
    '井上',
    '宇野',
    '江古田',
    '大垣',
    '加藤',
    '加納',
    '喜嶋',
    '木村',
    '桐山',
    '工藤',
    '小泉',
    '小林',
    '近藤',
    '斉藤',
    '坂本',
    '佐々木',
    '佐藤',
    '笹田',
    '鈴木',
    '杉山',
    '高橋',
    '田中',
    '田辺',
    '津田',
    '中島',
    '中村',
    '渚',
    '中津川',
    '西之園',
    '野村',
    '原田',
    '浜田',
    '廣川',
    '藤本',
    '松本',
    '三宅',
    '宮沢',
    '村山',
    '山岸',
    '山口',
    '山田',
    '山本',
    '吉田',
    '吉本',
    '若松',
    '渡辺',
  ]
}

1;
