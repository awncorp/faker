package Faker::Plugin::InternetPortWellKnown;

use 5.018;

use strict;
use warnings;

use Venus::Class 'base';

base 'Faker::Plugin';

# METHODS

sub execute {
  my ($self, $data) = @_;

  my $random = $self->faker->random;

  return $random->range(0, 1023);
    
}

1;



=head1 NAME

Faker::Plugin::InternetPortWellKnown - Internet Well Known Port 

=cut

=head1 ABSTRACT

Internet Well Known Port for Faker

=cut

=head1 SYNOPSIS

  package main;

  use Faker::Plugin::InternetPortWellKnown;

  my $plugin = Faker::Plugin::InternetPortWellKnown->new;

  # bless(..., "Faker::Plugin::InternetPortWellKnown")

=cut

=head1 DESCRIPTION

This package provides methods for generating fake data for internet well known port.

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

The execute method returns a returns a random fake internet well known port.

I<Since C<1.10>>

=over 4

=item execute example 1

  package main;

  use Faker::Plugin::InternetPortWellKnown;

  my $plugin = Faker::Plugin::InternetPortWellKnown->new;

  # bless(..., "Faker::Plugin::InternetPortWellKnown")

  # my $result = $plugin->execute;

  # 80;

  # my $result = $plugin->execute;

  # 69;

  # my $result = $plugin->execute;

  # 22;

=back

=cut

=head2 new

  new(HashRef $data) (Plugin)

The new method returns a new instance of the class.

I<Since C<1.10>>

=over 4

=item new example 1

  package main;

  use Faker::Plugin::InternetPortWellKnown;

  my $plugin = Faker::Plugin::InternetPortWellKnown->new;

  # bless(..., "Faker::Plugin::InternetPortWellKnown")

=back

=cut