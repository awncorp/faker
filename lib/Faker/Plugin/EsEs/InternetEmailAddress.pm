package Faker::Plugin::EsEs::InternetEmailAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EsEs';

# VERSION

our $VERSION = '1.19';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $email_address = $self->process_markers(
    $self->process_format(
      $self->faker->random->select(data_for_internet_email_address())
    )
  );

  $email_address = lc $self->transliterate($email_address);

  $email_address =~ s/\s+/-/g;

  return $email_address;
}

sub data_for_internet_email_address {
  state $internet_email_address = [
    '{{person_last_name}}.{{person_first_name}}@{{internet_domain_name}}',
    '{{person_last_name}}.{{person_first_name}}@{{internet_email_domain}}',
    '{{person_first_name}}.{{person_last_name}}@{{internet_domain_name}}',
    '{{person_first_name}}.{{person_last_name}}@{{internet_email_domain}}',
    '{{person_first_name}}##@{{internet_domain_name}}',
    '{{person_first_name}}##@{{internet_email_domain}}',
    '{{person_first_name}}####@{{internet_domain_name}}',
    '{{person_first_name}}####@{{internet_email_domain}}',
    '?{{person_last_name}}@{{internet_domain_name}}',
    '?{{person_last_name}}@{{internet_email_domain}}',
    '?{{person_last_name}}####@{{internet_domain_name}}',
    '?{{person_last_name}}####@{{internet_email_domain}}',
  ]
}

1;
