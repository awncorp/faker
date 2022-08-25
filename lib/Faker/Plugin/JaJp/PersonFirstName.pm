package Faker::Plugin::JaJp::PersonFirstName;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return (lc($self->faker->person_gender) eq 'male')
    ? $self->faker->random->select(data_for_first_name_male())
    : $self->faker->random->select(data_for_first_name_female());
}

sub data_for_first_name_male {
  state $first_name = [
    '晃',
    '篤司',
    '治',
    '和也',
    '京助',
    '健一',
    '修平',
    '翔太',
    '淳',
    '聡太郎',
    '太一',
    '太郎',
    '拓真',
    '翼',
    '智也',
    '直樹',
    '直人',
    '英樹',
    '浩',
    '学',
    '充',
    '稔',
    '裕樹',
    '裕太',
    '康弘',
    '陽一',
    '洋介',
    '亮介',
    '涼平',
    '零',
  ]
}

sub data_for_first_name_female {
  state $first_name = [
    '明美',
    'あすか',
    '香織',
    '加奈',
    'くみ子',
    'さゆり',
    '知実',
    '千代',
    '直子',
    '七夏',
    '花子',
    '春香',
    '真綾',
    '舞',
    '美加子',
    '幹',
    '桃子',
    '結衣',
    '裕美子',
    '陽子',
    '里佳',
  ]
}

1;
