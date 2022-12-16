package Faker::Plugin::EnUs::InternetEmailAddress;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin::EnUs';

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

  return lc $email_address =~ s/[^\w\@\.-]//gr;
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
