package Faker::Plugin::JaJp::InternetEmailAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::JaJp';

# VERSION

our $VERSION = '1.16';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $email_address = $self->process_markers(
    $self->process_format(
      $self->faker->random->select(data_for_internet_email_address())
    )
  );

  $email_address =~ s/\s+/-/g;

  return lc $email_address;
}

sub data_for_internet_email_address {
  state $internet_email_address = [
    '{{person_last_name_ascii}}.{{person_first_name_ascii}}@{{internet_domain_name}}',
    '{{person_last_name_ascii}}.{{person_first_name_ascii}}@{{internet_email_domain}}',
    '{{person_first_name_ascii}}.{{person_last_name_ascii}}@{{internet_domain_name}}',
    '{{person_first_name_ascii}}.{{person_last_name_ascii}}@{{internet_email_domain}}',
    '{{person_first_name_ascii}}##@{{internet_domain_name}}',
    '{{person_first_name_ascii}}##@{{internet_email_domain}}',
    '{{person_first_name_ascii}}####@{{internet_domain_name}}',
    '{{person_first_name_ascii}}####@{{internet_email_domain}}',
    '?{{person_last_name_ascii}}@{{internet_domain_name}}',
    '?{{person_last_name_ascii}}@{{internet_email_domain}}',
    '?{{person_last_name_ascii}}####@{{internet_domain_name}}',
    '?{{person_last_name_ascii}}####@{{internet_email_domain}}',
  ]
}

1;
