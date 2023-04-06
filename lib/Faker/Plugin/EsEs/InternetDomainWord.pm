package Faker::Plugin::EsEs::InternetDomainWord;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.18';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $domain_word = lc $self->transliterate($self->faker->company_name);

  $domain_word =~ s/\W+/-/g;
  $domain_word =~ s/^\W+|\W+$//g;

  return $domain_word;
}

1;
