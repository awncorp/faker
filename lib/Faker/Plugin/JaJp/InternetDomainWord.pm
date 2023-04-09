package Faker::Plugin::JaJp::InternetDomainWord;

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

  return $self->process_format(
    $self->faker->random->select(data_for_internet_domain_word())
  );
}

sub data_for_internet_domain_word {
  state $internet_domain_word = [
    '{{person_last_name_ascii}}',
  ]
}

1;
