package Faker::Plugin::InternetPort;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  return $self->faker->random->bit
    ? $self->faker->InternetPortDynamic
    : ( $self->faker->random->bit
	   ? $self->faker->InternetPortRegistered
		: $self->faker->InternetPortWellKnown)
}

1;



=head1 NAME

Faker::Plugin::InternetPort - Internet Port

=cut

=head1 ABSTRACT

Internet Port for Faker

=cut

=head1 SYNOPSIS

  package main;

  use Faker::Plugin::InternetPort;

  my $plugin = Faker::Plugin::InternetPort->new;

  # bless(..., "Faker::Plugin::InternetPort")

=cut

=head1 DESCRIPTION

This package provides methods for generating fake data for internet ip address.

=encoding utf8

=cut

=head1 INHERITS

This package inherits behaviors from:

L<Faker::Plugin>

=cut

=head1 METHODS

This package provides the following methods:

=cut

=head2 execute

  execute(HashRef $data) (Str)

The execute method returns a returns a random fake internet ip address.

I<Since C<1.10>>

=over 4

=item execute example 1

  package main;

  use Faker::Plugin::InternetIpAddress;

  my $plugin = Faker::Plugin::InternetIpAddress->new;

  # bless(..., "Faker::Plugin::InternetIpAddress")

  # my $result = $plugin->execute;

  # "108.20.219.127";

  # my $result = $plugin->execute;

  # "7680:93e0:88b2:06a0:c512:99e4:e8a9:7d48";

  # my $result = $plugin->execute;

  # "89.236.15.220";

=back

=cut

=head2 new

  new(HashRef $data) (Plugin)

The new method returns a new instance of the class.

I<Since C<1.10>>

=over 4

=item new example 1

  package main;

  use Faker::Plugin::InternetIpAddress;

  my $plugin = Faker::Plugin::InternetIpAddress->new;

  # bless(..., "Faker::Plugin::InternetIpAddress")

=back

=cut